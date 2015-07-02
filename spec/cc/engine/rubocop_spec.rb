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
        assert !includes_check?(output, "Style/UselessAssignment")
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
        config = {"exclude_paths" => ['my_script']}
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
        config = { "config" => 'rubocop.yml', "exclude_paths" => ['bar.rb'] }
        output = run_engine(config)
        assert !includes_check?(output, "Lint/UselessAssignment")
      end

      it "handles different locations properly" do
        RuboCop::Cop::Team.any_instance.expects(:inspect_file).returns([OpenStruct.new(
          location: RuboCop::Cop::Lint::Syntax::PseudoSourceRange.new(1, 0, ''),
          cop_name: "fake",
          message: "message"
        )])
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
            "begin" => { "column"=>1, "line"=>1 },
            "end" => { "column"=>1, "line"=>1 }
          }
        }
        assert_equal location, result["location"]
      end

      def includes_check?(output, cop_name)
        issues = output.split("\0").map { |x| JSON.parse(x) }

        !!issues.detect { |i| i["check_name"] =~ /#{cop_name}$/ }
      end

      def create_source_file(path, content)
        File.write(File.join(@code, path), content)
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
