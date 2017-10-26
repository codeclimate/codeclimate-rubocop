# frozen_string_literal: true

require "mry"
require "rubocop/config_loader"

module CC
  module Engine
    class ConfigUpgrader
      module Patch
        private

        def cc_config_upgrader
          @cc_config_upgrader ||= CC::Engine::ConfigUpgrader.new
        end

        def yaml_safe_load(yaml_code, filename)
          super(
            cc_config_upgrader.run(yaml_code),
            filename
          )
        end
      end

      def initialize
        @rewriters, @reverse_rewriters = *Mry::Rewriters.rewriters(rubocop_version)
      end

      def run(original_yaml)
        yaml = original_yaml.dup

        reverse_rewriters.each do |r|
          yaml = r.new(yaml, reverse: true).rewrite
        end
        rewriters.each do |r|
          yaml = r.new(yaml).rewrite
        end

        yaml
      end

      private

      attr_reader :reverse_rewriters, :rewriters

      def rubocop_version
        Gem::Version.new(RuboCop::Version.version)
      end
    end
  end
end

RuboCop::ConfigLoader.singleton_class.prepend CC::Engine::ConfigUpgrader::Patch
