require "json"
require "pathname"
require "rubocop"
require "rubocop/cop/method_complexity_patch"
require "cc/engine/file_list_resolver"
require "cc/engine/violation_hash"

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

      def inspect_file(path)
        parsed = RuboCop::ProcessedSource.from_file(path)
        rubocop_team_for_path(path).inspect_file(parsed).each do |violation|
          json = ViolationHash.new(violation, local_path(path)).to_json
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
    end
  end
end
