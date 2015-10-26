require "spec_helper"
require "cc/engine/violation_decorator"

module CC::Engine
  describe ViolationDecorator do
    describe "#remediation points" do
      it "returns remediation points for violation" do
        fake_violation = Minitest::Mock.new
        fake_violation.expect :cop_name, :unknown_cop
        fake_violation.expect :message, "This has no multiplier!"

        decorated_violation = ViolationDecorator.new(fake_violation)

        decorated_violation.remediation_points.must_equal(
          ViolationDecorator::DEFAULT_REMEDIATION_POINTS
        )
      end

      it "returns remedation points plus per violation points multiplied by overage" do
        fake_violation = Minitest::Mock.new
        fake_violation.expect :cop_name, :unknown_cop
        fake_violation.expect :cop_name, :unknown_cop
        fake_violation.expect :message, "This has [22/20] multiplier!"
        fake_violation.expect :message, "This has [22/20] multiplier!"

        decorated_violation = ViolationDecorator.new(fake_violation)

        violation_pointss = ViolationDecorator::DEFAULT_POINTS_PER_VIOLATION * 2
        base_points = ViolationDecorator::DEFAULT_REMEDIATION_POINTS

        decorated_violation.remediation_points.must_equal(
          violation_pointss + base_points
        )
      end
    end
  end
end
