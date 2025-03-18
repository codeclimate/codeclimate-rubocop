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
        rubocop_team.investigate(processed_source).offenses.each do |offense|
          next if offense.disabled?

          io.print Issue.new(offense, display_path).to_json
          io.print "\0"
        end
      end

      private

      attr_reader :config_store, :io, :path, :root

      def processed_source
        processed_source = RuboCop::ProcessedSource.from_file(path, target_ruby_version)
        processed_source.config = config_store if processed_source.respond_to?(:config=)
        processed_source.registry = RuboCop::Cop::Registry.global if processed_source.respond_to?(:registry=)
        processed_source
      end

      def target_ruby_version
        config_store.target_ruby_version
      end

      def rubocop_team
        RuboCop::Cop::Team.mobilize(RuboCop::Cop::Registry.global, config_store, display_cop_names: false)
      end

      def display_path
        realpath = Pathname.new(root).realpath.to_s
        path.gsub(%r{^#{realpath}/}, "")
      end
    end
  end
end
