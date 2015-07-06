require "json"
require "pathname"
require "rubocop"
require "cc/engine/category_parser"

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
          runner = RuboCop::Runner.new({}, rubocop_config_store)
          paths = runner.send :find_target_files, []
          paths.each do |path|
            realpath = Pathname.new(@code).realpath.to_s
            local_path = path.gsub(%r|^#{realpath}/|, '')
            unless exclude?(local_path)
              parsed = RuboCop::ProcessedSource.from_file(path)
              rubocop_team_for_path(path).inspect_file(parsed).each do |violation|
                json = violation_json(violation, local_path)
                @io.print "#{json}\0"
              end
            end
          end
        end
      end

      private

      def category(cop_name)
        CategoryParser.new(cop_name).category
      end

      def exclude?(local_path)
        exclusions = @engine_config["exclude_paths"] || []
        exclusions.include?(local_path)
      end

      def rubocop_config_store
        @rubocop_config_store ||= begin
          config_store = RuboCop::ConfigStore.new
          if (config_file = @engine_config["config"])
            config_store.options_config = config_file
          end
          config_store
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
          begin:  {
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
        {
          type: "Issue",
          check_name: "Rubocop/#{violation.cop_name}",
          description: violation.message,
          categories: [category(violation.cop_name)],
          remediation_points: 50_000,
          location: {
            path: local_path,
            positions: violation_positions(violation.location),
          },
        }.to_json
      end
    end
  end
end
