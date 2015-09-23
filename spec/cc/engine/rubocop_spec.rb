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

        assert includes_check?(output, "Lint/UselessAssignment")
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

        assert includes_check?(output, "Style/AndOr")
        assert !includes_check?(output, "Lint/UselessAssignment")
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

        assert includes_check?(output, "Style/AndOr")
        assert !includes_check?(output, "Lint/UselessAssignment")
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
        assert includes_check?(output, "Lint/UselessAssignment")
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
        assert !includes_check?(output, "Lint/UselessAssignment")
      end

      it "uses exclusions passed in via the config hash" do
        create_source_file("my_script", <<-EORUBY)
          #!/usr/bin/env ruby

          def method
            unused = "x"

            return false
          end
        EORUBY
        config = { "exclude_paths" => ["my_script"] }
        output = run_engine(config)
        assert !includes_check?(output, "Lint/UselessAssignment")
      end

      it "layers config exclusions on top of the YAML config" do
        create_source_file("foo.rb", <<-EORUBY)
          def method
            unused = "x"
            return false
          end
        EORUBY
        create_source_file("bar.rb", <<-EORUBY)
          def method
            unused = "x"
            return false
          end
        EORUBY
        create_source_file(
          "rubocop.yml",
          "AllCops:\n  Exclude:\n    - \"foo.rb\"\n"
        )
        config = { "config" => "rubocop.yml", "exclude_paths" => ["bar.rb"] }
        output = run_engine(config)
        assert !includes_check?(output, "Lint/UselessAssignment")
      end

      it "handles different locations properly" do
        RuboCop::Cop::Team.any_instance.expects(:inspect_file).returns(
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
        assert_equal location, result["location"]
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
        assert includes_check?(output, "Metrics/CyclomaticComplexity")

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
        assert_equal location, result["location"]
      end

      it "includes issue content when available" do
        lines = "  test\n" * 101
        create_source_file("klass.rb", "class Klass\n#{lines}end")

        output = run_engine

        assert includes_content_for?(output, "Metrics/ClassLength")
      end

      it "includes remediation points" do
        create_source_file("klass.rb", <<-EORUBY)
          class Klass
            def method
            end
            def method
            end
          end
        EORUBY

        output = run_engine
        issue = issue(output, "Lint/DuplicateMethods")
        assert_equal issue['remediation_points'], 100_000
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
        assert !includes_check?(output, "Lint/UselessAssignment")
        assert !includes_check?(output, "Style/AndOr")
      end

      it "ignores non-Ruby files even when passed in as include_paths" do
        config_yml = "foo:\n  bar: \"baz\""
        create_source_file("config.yml", config_yml)
        output = run_engine(
          "include_paths" => %w[config.yml]
        )
        refute(issues(output).detect do |i|
          i["description"] == "unexpected token tCOLON"
        end)
      end

      it "includes Ruby files even if they don't end with .rb" do
        create_source_file("Rakefile", <<-EORUBY)
          def method
            unused = "x"

            return false
          end
        EORUBY
        output = run_engine("include_paths" => %w[Rakefile])
        assert includes_check?(output, "Lint/UselessAssignment")
      end

      def includes_check?(output, cop_name)
        issue(output, cop_name).present?
      end

      def includes_content_for?(output, cop_name)
        issue = issue(output, cop_name)

        issue["content"]["body"].present?
      end

      def issue(output, cop_name)
        issues(output).detect { |i| i["check_name"] =~ /#{cop_name}$/ }
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
