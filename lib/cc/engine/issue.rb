require 'safe_yaml'
SafeYAML::OPTIONS[:default_mode] = :safe

module CC
  module Engine
    class Issue < SimpleDelegator
      MULTIPLIER_REGEX = %r{\[([\d\.]+)\/([\d\.]+)\]}
      DEFAULT_REMEDIATION_POINTS = 50_000
      DEFAULT_BASE_POINTS = 200_000
      DEFAULT_OVERAGE_POINTS = 50_000

      def initialize(issue, path, cop_list: nil)
        @path = path
        @cop_list = cop_list
        super(issue)
      end

      # rubocop:disable Metrics/MethodLength
      def to_json
        hash = {
          type: "Issue",
          check_name: "Rubocop/#{cop_name}",
          description: message,
          categories: [category],
          remediation_points: remediation_points,
          location: {
            path: path,
            positions: positions,
          },
        }
        hash[:content] = { body: content_body } if content_body.present?
        hash.to_json
      end

      def remediation_points
        if multiplier?
          base_points + overage_points
        else
          cop_definition.fetch("remediation_points", DEFAULT_REMEDIATION_POINTS)
        end
      end

      private

      attr_reader :path

      def multiplier?
        message.match(MULTIPLIER_REGEX)
      end

      def base_points
        cop_definition.fetch("base_points", DEFAULT_BASE_POINTS)
      end

      def cop_definition
        @cop_definition ||= cop_list.fetch(cop_name, {})
      end

      def cop_list
        @cop_list ||= YAML.load_file(expand_config_path("cops.yml"))
      end

      def expand_config_path(path)
        File.expand_path("../../../../config/#{path}", __FILE__)
      end

      def overage_points
        overage_points = cop_definition.
          fetch("overage_points", DEFAULT_OVERAGE_POINTS)

        overage_points * multiplier
      end

      def multiplier
        result = message.scan(MULTIPLIER_REGEX)
        score, max = result[0]
        score.to_i - max.to_i
      end

      def category
        CategoryParser.new(cop_name).category
      end

      def positions
        {
          begin: {
            column: columns.first,
            line: lines.first,
          },
          end: {
            column: columns.last,
            line: lines.last,
          }
        }
      end

      # Increment column value as columns are 0-based in parser
      def columns
        return @columns if defined?(@columns)

        if location.is_a?(RuboCop::Cop::Lint::Syntax::PseudoSourceRange)
          @columns = [location.column + 1, location.column + 1]
        else
          @columns = [location.column + 1, location.last_column + 1]
        end
      end

      def lines
        return @lines if defined?(@lines)

        if location.is_a?(RuboCop::Cop::Lint::Syntax::PseudoSourceRange)
          @lines = [location.line, location.line]
        else
          @lines = [location.first_line, location.last_line]
        end
      end

      def content_body
        return @content_body if defined?(@content_body)
        content_path = expand_config_path("contents/#{cop_name.underscore}.md")
        @content_body = File.exist?(content_path) && File.read(content_path)
      end
    end
  end
end
