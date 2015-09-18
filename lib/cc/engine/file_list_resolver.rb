module CC
  module Engine
    class FileListResolver
      def initialize(code:, engine_config: {}, rubocop_config_store:)
        @code = code
        @exclude_paths = engine_config["exclude_paths"] || []
        @include_paths = engine_config["include_paths"]
        @rubocop_config_store = rubocop_config_store
      end

      def expanded_list
        if @include_paths
          include_based_files_to_inspect
        else
          exclude_based_files_to_inspect
        end
      end

      protected

      def exclude_based_files_to_inspect
        rubocop_runner.send(:find_target_files, []).reject do |path|
          exclude_due_to_config?(path)
        end
      end

      def exclude_due_to_config?(path)
        @exclude_paths.include?(local_path(path))
      end

      def include_based_files_to_inspect
        @include_paths.map do |path|
          if path =~ %r{/$}
            rubocop_runner.send(:find_target_files, [path])
          elsif rubocop_file_to_include?(path)
            path
          end
        end.flatten.compact
      end

      def local_path(path)
        realpath = Pathname.new(@code).realpath.to_s
        path.gsub(%r|^#{realpath}/|, '')
      end

      def rubocop_file_to_include?(file)
        if file =~ /\.rb$/
          true
        else
          dir = File.dirname(file)
          basename = File.basename(file)
          @rubocop_config_store.for(dir).file_to_include?(basename)
        end
      end

      def rubocop_runner
        @rubocop_runner ||= RuboCop::Runner.new({}, @rubocop_config_store)
      end
    end
  end
end
