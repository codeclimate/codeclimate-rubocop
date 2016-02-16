require "spec_helper"
require "cc/engine/rubocop"
require "tmpdir"

module CC::Engine
  describe Rubocop do
    before { @code = Dir.mktmpdir }

    describe "#run" do
      it "analyzes ruby files using rubocop" do
        create_source_file("foo.rb", <<-EORUBY)
          def method
            unused = "x"

            return false
          end
        EORUBY

        output = run_engine

        expect(includes_check?(output, "Lint/UselessAssignment")).to be true
      end

      it "reads the configured ruby_style file" do
        create_source_file("foo.rb", <<-EORUBY)
          def method
            unused = "x" and "y"

            return false
          end
        EORUBY

        create_source_file(
          "rubocop.yml",
          "Lint/UselessAssignment:\n  Enabled: false\n"
        )

        config = { "config" => "rubocop.yml" }
        output = run_engine(config)

        expect(includes_check?(output, "Style/AndOr")).to be true
        expect(includes_check?(output, "Lint/UselessAssignment")).to be false
      end

      it "respects the default .rubocop.yml file" do
        create_source_file("foo.rb", <<-EORUBY)
          def method
            unused = "x" and "y"

            return false
          end
        EORUBY

        create_source_file(
          ".rubocop.yml",
          "Lint/UselessAssignment:\n  Enabled: false\n"
        )

        output = run_engine

        expect(includes_check?(output, "Style/AndOr")).to be true
        expect(includes_check?(output, "Lint/UselessAssignment")).to be false
      end

      it "respects excludes in an inherit_from directive" do
        create_source_file("foo.rb", <<-EORUBY)
          def method
            unused = "x"
            return false
          end
        EORUBY
        create_source_file("bar.rb", <<-EORUBY)
          def method
            unused = 42
            return true
          end
        EORUBY

        create_source_file(
          ".rubocop.yml",
          "inherit_from: .rubocop_todo.yml\nAllCops:\n  DisabledByDefault: true\nLint/UselessAssignment:\n  Enabled: true\n"
        )
        create_source_file(
          ".rubocop_todo.yml",
          "Lint/UselessAssignment:\n  Exclude:\n    - bar.rb\n"
        )

        output = run_engine("include_paths" => ["foo.rb", "bar.rb"])
        issues = output.split("\0").map { |istr| JSON.parse(istr) }
        lint_issues = issues.select { |issue| issue["check_name"] == "Rubocop/Lint/UselessAssignment" }

        expect(lint_issues.detect { |i| i["location"]["path"] == "foo.rb" }).to be_present
        expect(lint_issues.detect { |i| i["location"]["path"] == "bar.rb" }).to be_nil
      end

      it "reads a file with a #!.*ruby declaration at the top" do
        create_source_file("my_script", <<-EORUBY)
          #!/usr/bin/env ruby

          def method
            unused = "x"

            return false
          end
        EORUBY
        output = run_engine

        expect(includes_check?(output, "Lint/UselessAssignment")).to be true
      end

      it "uses excludes from the specified YAML config" do
        create_source_file("my_script", <<-EORUBY)
          #!/usr/bin/env ruby

          def method
            unused = "x"

            return false
          end
        EORUBY
        create_source_file(
          "rubocop.yml",
          "AllCops:\n  Exclude:\n    - \"my_script\"\n"
        )
        config = { "config" => "rubocop.yml" }
        output = run_engine(config)

        expect(includes_check?(output, "Lint/UselessAssignment")).to be false
      end

      it "handles different locations properly" do
        allow_any_instance_of(RuboCop::Cop::Team).to receive(:inspect_file).and_return(
          [
            OpenStruct.new(
              location: RuboCop::Cop::Lint::Syntax::PseudoSourceRange.new(
                1, 0, ""
              ),
              cop_name: "fake",
              message: "message"
            )
          ]
        )
        create_source_file("my_script.rb", <<-EORUBY)
          #!/usr/bin/env ruby

          def method
            unused = "x"

            return false
          end
        EORUBY
        output = run_engine
        json = output.split("\u0000")

        result = JSON.parse(json.first)
        location = {
          "path" => "my_script.rb",
          "positions" => {
            "begin" => { "column" => 1, "line" => 1 },
            "end" => { "column" => 1, "line" => 1 }
          }
        }

        expect(result["location"]).to eq(location)
      end

      it "includes complete method body for cyclomatic complexity issue" do
        create_source_file("my_script", <<-EORUBY)
          #!/usr/bin/env ruby

          def method(a,b,c,d,e,f,g)
            r = 1
            if a
              if !b
                if c
                  if !d
                    if e
                      if !f
                        (1..g).each do |n|
                          r = (r * n) - n
                        end
                      end
                    end
                  end
                end
              end
            end
            r
          end
        EORUBY
        output = run_engine
        expect(includes_check?(output, "Metrics/CyclomaticComplexity")).to be true

        json = JSON.parse('[' + output.split("\u0000").join(',') + ']')

        result = json.find do |i|
          i && i["check_name"] =~ %r{Metrics\/CyclomaticComplexity}
        end
        location = {
          "path" => "my_script",
          "positions" => {
            "begin" => { "column" => 11, "line" => 3 },
            "end" => { "column" => 14, "line" => 21 }
          }
        }

        expect(result["location"]).to eq(location)
      end

      it "includes issue content when available" do
        lines = "  test\n" * 101
        create_source_file("klass.rb", "class Klass\n#{lines}end")

        output = run_engine

        expect(includes_content_for?(output, "Metrics/ClassLength")).to be true
      end

      it "uses only include_paths when they're passed in via the config hash" do
        okay_contents = <<-EORUBY
          #!/usr/bin/env ruby

          puts "Hello world"
        EORUBY
        create_source_file("included_root_file.rb", okay_contents)
        create_source_file("subdir/subdir_file.rb", okay_contents)
        create_source_file("ignored_root_file.rb", <<-EORUBY)
          def method
            unused = "x" and "y"

            return false
          end
        EORUBY
        create_source_file("ignored_subdir/subdir_file.rb", <<-EORUBY)
          def method
            unused = "x"

            return false
          end
        EORUBY
        output = run_engine(
          "include_paths" => %w[included_root_file.rb subdir/]
        )

        expect(includes_check?(output, "Lint/UselessAssignment")).to be false
        expect(includes_check?(output, "Style/AndOr")).to be false
      end

      it "ignores non-Ruby files even when passed in as include_paths" do
        config_yml = "foo:\n  bar: \"baz\""
        create_source_file("config.yml", config_yml)
        output = run_engine(
          "include_paths" => %w[config.yml]
        )
        issue = issues(output).detect do |i|
          i["description"] == "unexpected token tCOLON"
        end

        expect(issue).to be nil
      end

      it "includes Ruby files even if they don't end with .rb" do
        create_source_file("Rakefile", <<-EORUBY)
          def method
            unused = "x"

            return false
          end
        EORUBY
        output = run_engine("include_paths" => %w[Rakefile])

        expect(includes_check?(output, "Lint/UselessAssignment")).to be true
      end

      it "skips local disables" do
        create_source_file("test.rb", <<-EORUBY)
          def method
            # rubocop:disable UselessAssignment
            unused = "x"

            return false
          end
        EORUBY
        output = run_engine

        expect(includes_check?(output, "Lint/UselessAssignment")).to be false
      end

      it "shows full source of long methods" do
        create_source_file("test.rb", <<-EORUBY)
          def method
            #{"puts 'hi'\n" * 10}
            return false
          end
        EORUBY
        output = run_engine
        issues = output.split("\0").map { |issue| JSON.parse(issue) }
        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/MethodLength"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(1)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(14)
      end

      it "shows full source of long classes" do
        create_source_file("test.rb", <<-EORUBY)
          class Awesome
            #{"foo = 1\n" * 102}
          end
        EORUBY
        output = run_engine
        issues = output.split("\0").map { |issue| JSON.parse(issue) }
        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/ClassLength"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(1)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(105)
      end

      def includes_check?(output, cop_name)
        issues(output).any? { |i| i["check_name"] =~ /#{cop_name}$/ }
      end

      def includes_content_for?(output, cop_name)
        issue = issues(output).detect { |i| i["check_name"] =~ /#{cop_name}$/ }

        issue["content"] && issue["content"]["body"].present?
      end

      def issues(output)
        output.split("\0").map { |x| JSON.parse(x) }
      end

      def create_source_file(path, content)
        abs_path = File.join(@code, path)
        FileUtils.mkdir_p(File.dirname(abs_path))
        File.write(abs_path, content)
      end

      def run_engine(config = nil)
        io = StringIO.new
        rubocop = Rubocop.new(@code, config, io)
        rubocop.run

        io.string
      end
    end
  end
end
