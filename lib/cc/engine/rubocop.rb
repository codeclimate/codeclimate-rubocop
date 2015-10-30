require "json"
require "pathname"
require "rubocop"
require "rubocop/cop/method_complexity_patch"
require "cc/engine/category_parser"
require "cc/engine/file_list_resolver"
require "cc/engine/violation_decorator"
require "active_support"
require "active_support/core_ext"

module CC
  module Engine
    class Rubocop
      def initialize(code, engine_config, io)
        @code = code
        @engine_config = engine_config || {}
        @io = io
      end

      def run
        Dir.chdir(@code) do
          files_to_inspect.each do |path|
            inspect_file(path)
          end
        end
      end

      private

      def files_to_inspect
        @file_list_resolver = FileListResolver.new(
          code: @code,
          engine_config: @engine_config,
          rubocop_config_store: rubocop_config_store
        )
        @file_list_resolver.expanded_list
      end

      def category(cop_name)
        CategoryParser.new(cop_name).category
      end

      def inspect_file(path)
        parsed = RuboCop::ProcessedSource.from_file(path)
        rubocop_team_for_path(path).inspect_file(parsed).each do |violation|
          decorated_violation = ViolationDecorator.new(violation)
          json = violation_json(decorated_violation, local_path(path))
          @io.print "#{json}\0"
        end
      end

      def local_path(path)
        realpath = Pathname.new(@code).realpath.to_s
        path.gsub(%r{^#{realpath}/}, '')
      end

      def rubocop_config_store
        @rubocop_config_store ||= begin
          Dir.chdir(@code) do
            config_store = RuboCop::ConfigStore.new
            if (config_file = @engine_config["config"])
              config_store.options_config = config_file
            end
            config_store
          end
        end
      end

      def rubocop_team_for_path(path)
        rubocop_config = rubocop_config_store.for(path)
        RuboCop::Cop::Team.new(RuboCop::Cop::Cop.all, rubocop_config)
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

      def violation_json(violation, local_path)
        violation_hash = {
          type: "Issue",
          check_name: "Rubocop/#{violation.cop_name}",
          description: violation.message,
          categories: [category(violation.cop_name)],
          remediation_points: violation.remediation_points,
          location: {
            path: local_path,
            positions: violation_positions(violation.location),
          },
        }
        body = content_body(violation.cop_name)
        violation_hash.merge!(content: { body: body }) if body.present?
        violation_hash.to_json
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
