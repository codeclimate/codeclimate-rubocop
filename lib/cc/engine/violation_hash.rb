require "rubocop"
require "active_support"
require "active_support/core_ext"
require "cc/engine/category_parser"

module CC
  module Engine
    class ViolationHash
      def initialize(violation, local_path)
        @violation = violation
        @local_path = local_path
      end

      def to_json
        result = {
          type: "Issue",
          check_name: "Rubocop/#{violation.cop_name}",
          description: violation.message,
          categories: [category(violation.cop_name)],
          remediation_points: 50_000,
          location: {
            path: local_path,
            positions: violation_positions(violation.location),
          },
        }
        body = content_body(violation.cop_name)
        result.merge!(content: { body: body }) if body.present?
        result.to_json
      end

      private

      attr_reader :violation, :local_path

      def category(cop_name)
        CategoryParser.new(cop_name).category
      end

      def violation_positions(location)
        if location.is_a?(RuboCop::Cop::Lint::Syntax::PseudoSourceRange)
          first_line = location.line
          last_line = location.line
          first_column = location.column
          last_column = location.column
        else
          first_line = location.first_line
          last_line = location.last_line
          first_column = location.column
          last_column = location.last_column
        end

        {
          begin: {
            column: first_column + 1, # columns are 0-based in Parser
            line: first_line,
          },
          end: {
            column: last_column + 1,
            line: last_line,
          }
        }
      end

      def content_body(cop_name)
        path = File.expand_path(
          "../../../../config/contents/#{cop_name.underscore}.md", __FILE__
        )
        File.exist?(path) ? File.read(path) : nil
      end
    end
  end
end
