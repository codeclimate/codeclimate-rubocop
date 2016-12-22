# frozen_string_literal: true

require "digest/md5"

module CC
  module Engine
    class Fingerprint
      OVERRIDE_COP_NAMES = %w[
        Metrics/AbcSize
        Metrics/BlockLength
        Metrics/ClassLength
        Metrics/CyclomaticComplexity
        Metrics/MethodLength
        Metrics/ModuleLength
        Metrics/PerceivedComplexity
      ].freeze

      URL_REGEX = / \(https?\:.+\)/
      LINES_REGEX = / \[.+\]$/

      def initialize(path, cop_name, message)
        @path = path
        @cop_name = cop_name
        @message = message
      end

      def compute
        if OVERRIDE_COP_NAMES.include?(cop_name)
          md5 = Digest::MD5.new
          md5 << path
          md5 << cop_name
          md5 << stripped_message
          md5.hexdigest
        end
      end

      private

      attr_reader :path, :cop_name, :message

      def stripped_message
        message.gsub(URL_REGEX, "").strip.gsub(LINES_REGEX, "")
      end
    end
  end
end
