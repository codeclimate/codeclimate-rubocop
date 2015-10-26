require 'safe_yaml'

module CC
  module Engine
    class ViolationDecorator < SimpleDelegator
      MULTIPLIER_REGEX = %r{\[([\d\.]+)\/([\d\.]+)\]}

      DEFAULT_REMEDIATION_POINTS = 200_000
      DEFAULT_POINTS_PER_VIOLATION = 50_000

      def remediation_points
        if multiplier?
          base_points + violation_points
        else
          base_points
        end
      end

      private

      def base_points
        cop_list.
          fetch(cop_name, {}).
          fetch("base_points", DEFAULT_REMEDIATION_POINTS)
      end

      def violation_points
        per_violation_points = cop_list.
          fetch(cop_name, {}).
          fetch("violation_points", DEFAULT_POINTS_PER_VIOLATION)

        per_violation_points * multiplier
      end

      def multiplier
        result = message.scan(MULTIPLIER_REGEX)
        score, max = result[0]
        score.to_i - max.to_i
      end

      def multiplier?
        message.match(MULTIPLIER_REGEX)
      end

      def cop_list
        return @cop_list if @cop_list

        cops_path = File.expand_path(
          File.join(File.dirname(__FILE__), "../../../config/cops.yml")
        )

        @cop_list = YAML.load_file(cops_path)
      end
    end
  end
end
