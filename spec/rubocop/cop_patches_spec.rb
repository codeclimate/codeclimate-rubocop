# frozen_string_literal: true

require "spec_helper"

module CC::Engine
  describe "Rubocop cops patch" do
    include ::RubocopRunner

    describe "Metrics::AbcSize patch" do
      it "includes complete method body for cyclomatic complexity issue" do
        create_source_file("my_script", <<~EORUBY)
          #!/usr/bin/env ruby

          def method()
            r = 1
            #{"r = r.odd? ? r + r : r + 1\n" * 10}
            r
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Metrics/AbcSize"

        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/AbcSize"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(3)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(17)
      end
    end

    describe "Metrics::BlockLength patch" do
      it "shows full source of long blocks" do
        create_source_file("test.rb", <<~EORUBY)
          def method
            items.map do
              #{"puts 'hi'\n" * 26}
            end
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Metrics/BlockLength"

        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/BlockLength"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(2)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(30)
      end
    end

    describe "Metrics::ClassLength patch" do
      it "shows full source of long classes" do
        create_source_file("test.rb", <<~EORUBY)
          class Awesome
            #{"foo = 1\n" * 102}
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Metrics/ClassLength"

        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/ClassLength"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(1)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(105)
      end
    end

    describe "Metrics::CyclomaticComplexity patch" do
      it "includes complete method body for cyclomatic complexity issue" do
        create_source_file("my_script", <<~EORUBY)
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

        run_engine

        expect(issues).to include_check "Metrics/CyclomaticComplexity"

        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/CyclomaticComplexity"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(3)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(21)
      end
    end

    describe "Metrics::MethodLength patch" do
      it "shows full source of long methods" do
        create_source_file("test.rb", <<~EORUBY)
          def method
            #{"puts 'hi'\n" * 10}
            return false
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Metrics/MethodLength"

        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/MethodLength"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(1)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(14)
      end
    end

    describe "Metrics::ModuleLength patch" do
      it "shows full source of long classes" do
        create_source_file("test.rb", <<~EORUBY)
          module Awesome
            #{"foo = 1\n" * 102}
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Metrics/ModuleLength"

        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/ModuleLength"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(1)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(105)
      end
    end

    describe "Metrics::PerceivedComplexity patch" do
      it "includes complete method body for perceived complexity issue" do
        create_source_file("my_script", <<~EORUBY)
          #!/usr/bin/env ruby

          def method()
            r = 1
            #{"r = r.odd? ? r + r : r + 1\n" * 10}
            r
          end
        EORUBY

        run_engine

        expect(issues).to include_check "Metrics/PerceivedComplexity"

        issue = issues.find do |i|
          i["check_name"] == "Rubocop/Metrics/PerceivedComplexity"
        end

        expect(issue["location"]["positions"]["begin"]["line"]).to eq(3)
        expect(issue["location"]["positions"]["end"]["line"]).to eq(17)
      end
    end
  end
end
