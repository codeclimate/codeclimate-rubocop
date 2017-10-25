require "spec_helper"
require "cc/engine/rubocop"
require "tmpdir"

module CC::Engine
  describe Rubocop do
    include RubocopRunner

    describe "#run" do
      it "analyzes ruby files using rubocop" do
        create_source_file("foo.rb", <<-EORUBY)
          def method
            unused = "x"

            return false
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Lint/UselessAssignment"
      end

      it "reads the configured ruby_style file" do
        create_source_file("foo.rb", <<~EORUBY)
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
        run_engine(config)

        expect(issues).to include_check "Style/AndOr"
        expect(issues).to_not include_check "Lint/UselessAssignment"
      end

      it "generates a fingerprint for method/class offenses" do
        create_source_file("foo.rb", <<~EORUBY)
          def method(a, b, c, d)
            x = Math.sqrt((a * a) + (b * b)) + Math.sqrt((a * a) + (b * b))
            y = Math.sqrt((b * b) + (c * c)) + Math.sqrt((b * b) + (c * c))
            z = Math.sqrt((c * c) + (d * d)) + Math.sqrt((c * c) + (d * d))
            x + y + z
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Metrics/AbcSize"
        expect(issues).to include_fingerprint "303630e0015ba1c6de300b983babac59"
      end

      it "respects the default .rubocop.yml file" do
        create_source_file("foo.rb", <<~EORUBY)
          def method
            unused = "x" and "y"

            return false
          end
        EORUBY

        create_source_file(
          ".rubocop.yml",
          "Lint/UselessAssignment:\n  Enabled: false\n"
        )

        run_engine

        expect(issues).to include_check "Style/AndOr"
        expect(issues).to_not include_check "Lint/UselessAssignment"
      end

      it "respects excludes in an inherit_from directive" do
        create_source_file("foo.rb", <<~EORUBY)
          def method
            unused = "x"
            return false
          end
        EORUBY
        create_source_file("bar.rb", <<~EORUBY)
          def method
            unused = 42
            return true
          end
        EORUBY
        create_source_file(".rubocop.yml", <<~CONFIG)
          inherit_from: .rubocop_todo.yml
          AllCops:
            DisabledByDefault: true
          Lint/UselessAssignment:
            Enabled: true
        CONFIG
        create_source_file(".rubocop_todo.yml", <<~CONFIG)
          Lint/UselessAssignment:
            Exclude:
              - bar.rb
        CONFIG

        run_engine("include_paths" => ["foo.rb", "bar.rb"])
        lint_issues = issues.select { |issue| issue["check_name"] == "Rubocop/Lint/UselessAssignment" }

        expect(lint_issues.detect { |i| i["location"]["path"] == "foo.rb" }).to be_present
        expect(lint_issues.detect { |i| i["location"]["path"] == "bar.rb" }).to be_nil
      end

      it "reads a file with a #!.*ruby declaration at the top" do
        create_source_file("my_script", <<~EORUBY)
          #!/usr/bin/env ruby

          def method
            unused = "x"

            return false
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Lint/UselessAssignment"
      end

      it "uses excludes from the specified YAML config" do
        create_source_file("my_script", <<~EORUBY)
          #!/usr/bin/env ruby

          def method
            unused = "x"

            return false
          end
        EORUBY
        create_source_file("rubocop.yml", <<~CONFIG)
          AllCops:
            Exclude:
              - "my_script"
        CONFIG

        run_engine("config" => "rubocop.yml")

        expect(issues).to_not include_check "Lint/UselessAssignment"
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
        create_source_file("my_script.rb", <<~EORUBY)
          #!/usr/bin/env ruby

          def method
            unused = "x"

            return false
          end
        EORUBY

        run_engine

        location = {
          "path" => "my_script.rb",
          "positions" => {
            "begin" => { "column" => 1, "line" => 1 },
            "end" => { "column" => 1, "line" => 1 }
          }
        }

        expect(issues.first["location"]).to eq(location)
      end

      it "uses only include_paths when they're passed in via the config hash" do
        okay_contents = <<~EORUBY
          #!/usr/bin/env ruby

          puts "Hello world"
        EORUBY
        create_source_file("included_root_file.rb", okay_contents)
        create_source_file("subdir/subdir_file.rb", okay_contents)
        create_source_file("ignored_root_file.rb", <<~EORUBY)
          def method
            unused = "x" and "y"

            return false
          end
        EORUBY
        create_source_file("ignored_subdir/subdir_file.rb", <<~EORUBY)
          def method
            unused = "x"

            return false
          end
        EORUBY

        run_engine(
          "include_paths" => %w[included_root_file.rb subdir/]
        )

        expect(issues).to_not include_check "Lint/UselessAssignment"
        expect(issues).to_not include_check "Style/AndOr"
      end

      it "ignores non-Ruby files even when passed in as include_paths" do
        create_source_file("config.yml", <<~CONFIG)
          foo:
            bar: "baz"
        CONFIG

        run_engine(
          "include_paths" => %w[config.yml]
        )
        issue = issues.find do |i|
          i["description"] == "unexpected token tCOLON"
        end

        expect(issue).to be nil
      end

      it "includes Ruby files even if they don't end with .rb" do
        create_source_file("Rakefile", <<~EORUBY)
          def method
            unused = "x"

            return false
          end
        EORUBY

        run_engine("include_paths" => %w[Rakefile])

        expect(issues).to include_check "Lint/UselessAssignment"
      end

      it "skips local disables" do
        create_source_file("test.rb", <<~EORUBY)
          def method
            # rubocop:disable UselessAssignment
            unused = "x"

            return false
          end
        EORUBY

        run_engine

        expect(issues).to_not include_check "Lint/UselessAssignment"
      end
    end
  end
end
