require "spec_helper"
require "cc/engine/issue"

module CC::Engine
  describe Issue do
    describe "#to_json" do
      let(:issue) do
        location = OpenStruct.new
        location.first_line = 10
        location.last_line = 10
        location.column = 3
        location.last_column = 99

        offense = OpenStruct.new
        offense.cop_name = "Metrics/LineLength"
        offense.message = "Line too long [100/80]"
        offense.location = location

        Issue.new(offense, "app/models/user.rb")
      end

      it "returns a json issue for a Rubocop offense" do
        attributes = JSON.parse(issue.to_json)

        expect(attributes["type"]).to eq("Issue")
        expect(attributes["check_name"]).to eq("Rubocop/Metrics/LineLength")
        expect(attributes["description"]).to eq("Line too long [100/80]")
        expect(attributes["categories"]).to eq(["Style"])
        expect(attributes["remediation_points"]).to eq(50_000)
        expect(attributes["location"]["path"]).to eq("app/models/user.rb")
        expect(attributes["location"]["positions"]["begin"]["line"]).to eq(10)
        expect(attributes["location"]["positions"]["end"]["line"]).to eq(10)
        expect(attributes["location"]["positions"]["begin"]["column"]).to eq(4)
        expect(attributes["location"]["positions"]["end"]["column"]).to eq(100)
        expect(attributes["content"]["body"]).to include(
          "This cop checks the length of lines in the source code."
        )
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
