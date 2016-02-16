module CC
  module Engine
    class FileListResolver
      def initialize(root:, engine_config: {}, config_store:)
        @root = root
        @exclude_paths = engine_config["exclude_paths"] || []
        @include_paths = engine_config["include_paths"]
        @config_store = config_store
      end

      def expanded_list
        if @include_paths
          include_based_files_to_inspect
        else
          exclude_based_files_to_inspect
        end
      end

      private

      def exclude_based_files_to_inspect
        rubocop_runner.send(:find_target_files, []).reject do |path|
          exclude_due_to_config?(path)
        end
      end

      def exclude_due_to_config?(path)
        @exclude_paths.include?(local_path(path))
      end

      def include_based_files_to_inspect
        absolute_include_paths.flat_map do |path|
          if Dir.exist?(path)
            rubocop_runner.send(:find_target_files, [path])
          elsif rubocop_file_to_include?(path)
            path
          end
        end.compact
      end

      def local_path(path)
        realpath = Pathname.new(@root).realpath.to_s
        path.gsub(%r{^#{realpath}/}, '')
      end

      def absolute_include_paths
        @include_paths.map { |path| Pathname.new(path).realpath.to_s }
      end

      def rubocop_file_to_include?(file)
        if file =~ /\.rb$/
          true
        else
          root, basename = File.split(file)
          @config_store.for(root).file_to_include?(basename)
        end
      end

      def rubocop_runner
        @rubocop_runner ||= RuboCop::Runner.new({}, @config_store)
      end
    end
  end
end
