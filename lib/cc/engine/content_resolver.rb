# frozen_string_literal: true

require "active_support/core_ext/string"

module CC
  module Engine
    class ContentResolver
      def initialize(cop_name)
        @cop_name = cop_name
      end

      def content
        @content ||= File.exist?(content_path) && File.read(content_path)
      end

      def content_path
        @content_path ||= expand_config_path("contents/#{cop_name.sub("RuboCop::Cop::", "").underscore}.md")
      end

      private

      attr_reader :cop_name

      def expand_config_path(path)
        File.expand_path("../../../../config/#{path}", __FILE__)
      end
    end
  end
end
