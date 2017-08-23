# frozen_string_literal: true

module CC
  module Engine
    class SourceFile
      def initialize(config_store:, io:, path:, root:)
        @config_store = config_store
        @io = io
        @path = path
        @root = root
      end

      def inspect
        rubocop_team.inspect_file(processed_source).each do |offense|
          next if offense.disabled?

          io.print Issue.new(offense, display_path).to_json
          io.print "\0"
        end
      end

      private

      attr_reader :config_store, :io, :path, :root

      def processed_source
        RuboCop::ProcessedSource.from_file(path, target_ruby_version)
      end

      def target_ruby_version
        config_store.target_ruby_version
      end

      def rubocop_team
        RuboCop::Cop::Team.new(RuboCop::Cop::Registry.new(RuboCop::Cop::Cop.all), config_store)
      end

      def display_path
        realpath = Pathname.new(root).realpath.to_s
        path.gsub(%r{^#{realpath}/}, "")
      end
    end
  end
end
