require "spec_helper"
require "cc/engine/issue"

module CC::Engine
  describe Issue do
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
