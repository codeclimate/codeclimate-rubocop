# frozen_string_literal: true

require "spec_helper"
require "cc/engine/issue"
require "ostruct"

module CC::Engine
  describe Issue do
    describe "#to_json" do
      let(:offense) do
        location = OpenStruct.new
        location.first_line = 10
        location.last_line = 10
        location.column = 3
        location.last_column = 99

        offense = OpenStruct.new
        offense.cop_name = "Metrics/CyclomaticComplexity"
        offense.message = "Cyclomatic complexity for complex_method is too high [10/5]"
        offense.location = location
        offense
      end

      it "returns a json issue for a Rubocop offense" do
        issue = Issue.new(offense, "app/models/user.rb")
        attributes = JSON.parse(issue.to_json)

        expect(attributes["type"]).to eq("Issue")
        expect(attributes["check_name"]).to eq("Rubocop/Metrics/CyclomaticComplexity")
        expect(attributes["description"]).to eq("Cyclomatic complexity for complex_method is too high [10/5]")
        expect(attributes["categories"]).to eq(["Complexity"])
        expect(attributes["remediation_points"]).to eq(1_350_000)
        expect(attributes["location"]["path"]).to eq("app/models/user.rb")
        expect(attributes["location"]["positions"]["begin"]["line"]).to eq(10)
        expect(attributes["location"]["positions"]["end"]["line"]).to eq(10)
        expect(attributes["location"]["positions"]["begin"]["column"]).to eq(4)
        expect(attributes["location"]["positions"]["end"]["column"]).to eq(100)
        expect(attributes["content"]["body"].squish).to include(
          "Checks that the cyclomatic complexity of methods is not higher than the configured maximum."
        )
      end

      it "sets a fingerprint for method/class offenses" do
        offense.cop_name = "Metrics/AbcSize"
        issue = Issue.new(offense, "app/models/user.rb")
        attributes = JSON.parse(issue.to_json)

        expect(attributes).to have_key("fingerprint")
      end

      it "does not set a fingerprint for other offenses" do
        offense.cop_name = "Style/AlignParameters"
        issue = Issue.new(offense, "app/models/user.rb")
        attributes = JSON.parse(issue.to_json)

        expect(attributes).not_to have_key("fingerprint")
      end
    end

    describe "#remediation points" do
      describe "cop has configured remediation points" do
        describe "without a multiplier" do
          it "returns the configured remediation points" do
            cop_list = {
              "Metrics/BlockNesting" => {
                "remediation_points" => 300_000,
              }
            }
            offense = OpenStruct.new
            offense.cop_name = "Metrics/BlockNesting"
            offense.message = "This has no multiplier"
            issue = Issue.new(offense, "/code/file", cop_list: cop_list)

            expect(issue.remediation_points).to eq(300_000)
          end
        end

        describe "with a multiplier" do
          it "calculates remediation points using the configured base and overage points" do
            cop_list = {
              "Metrics/AbcSize" => {
                "base_points" => 5_000_000,
                "overage_points" => 100_000,
              }
            }
            offense = OpenStruct.new
            offense.cop_name = "Metrics/AbcSize"
            offense.message = "This has a [32/20] multiplier"
            issue = Issue.new(offense, "/code/file", cop_list: cop_list)
            base_points = 5_000_000
            overage_points = 100_000 * 12

            expect(issue.remediation_points).to eq(base_points + overage_points)
          end
        end
      end

      describe "cop has no configured remediation points" do
        describe "without a multiplier" do
          it "returns the default remediation points" do
            offense = OpenStruct.new
            offense.cop_name = "Some/UnconfiguredCop"
            offense.message = "This has no multiplier"
            issue = Issue.new(offense, "/code/file.rb")

            expect(issue.remediation_points).to eq(Issue::DEFAULT_REMEDIATION_POINTS)
          end
        end

        describe "with a multiplier" do
          it "calculates remediation points using the default base and overage points" do
            offense = OpenStruct.new
            offense.cop_name = "Some/UnconfiguredCop"
            offense.message = "This has a [22/20] multiplier"
            issue = Issue.new(offense, "/code/file")
            base_points = Issue::DEFAULT_BASE_POINTS
            overage_points = Issue::DEFAULT_OVERAGE_POINTS * 2

            expect(issue.remediation_points).to eq(base_points + overage_points)
          end
        end
      end
    end
  end
end
