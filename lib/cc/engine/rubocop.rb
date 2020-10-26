# frozen_string_literal: true

require "json"
require "delegate"
require "pathname"
require "rubocop"
require "rubocop/config_patch"
require "cc/engine/source_file"
require "cc/engine/category_parser"
require "cc/engine/file_list_resolver"
require "cc/engine/issue"
require "cc/engine/fingerprint"
require "active_support"
require "active_support/core_ext"

module CC
  module Engine
    class Rubocop
      def initialize(root, engine_config, io)
        @root = root
        @engine_config = engine_config || {}
        @io = io
      end

      def run
        check_mry_dependency
        Dir.chdir(root) do
          files_to_inspect.each do |path|
            SourceFile.new(
              config_store: config_store.for(path),
              io: io,
              path: path,
              root: root,
            ).inspect
          end
        end
      end

      private

      attr_reader :root, :engine_config, :io

      def files_to_inspect
        @files_to_inspect ||= FileListResolver.new(
          config_store: config_store,
          engine_config: engine_config,
          root: root,
        ).expanded_list
      end

      def config_store
        @config_store ||= RuboCop::ConfigStore.new.tap do |config_store|
          if (config_file = engine_config["config"])
            config_store.options_config = config_file
          end
        end
      end

      # MRY fell behind, may negatively alter rubocop config
      def check_mry_dependency
        require "cc/engine/config_upgrader" unless engine_config.dig("checks", "mry", "disabled")
      end
    end
  end
end
