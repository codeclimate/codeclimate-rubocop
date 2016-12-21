# frozen_string_literal: true

module CC
  module Engine
    class FileListResolver
      def initialize(root:, engine_config: {}, config_store:)
        @root = root
        @include_paths = engine_config["include_paths"] || ["./"]
        @config_store = config_store
      end

      def expanded_list
        absolute_include_paths.flat_map do |path|
          if Dir.exist?(path)
            rubocop_runner.send(:find_target_files, [path])
          elsif rubocop_file_to_include?(path)
            path
          end
        end.compact
      end

      private

      attr_reader :config_store

      def absolute_include_paths
        @include_paths.map do |path|
          begin
            Pathname.new(path).realpath.to_s
          rescue Errno::ENOENT
            nil
          end
        end.compact
      end

      def rubocop_file_to_include?(file)
        root, basename = File.split(file)
        store = config_store.for(root)

        return false if store.file_to_exclude?(basename)

        file =~ /\.rb$/ || store.file_to_include?(basename)
      end

      def rubocop_runner
        @rubocop_runner ||= RuboCop::Runner.new({}, @config_store)
      end
    end
  end
end
