require "digest/md5"

module CC
  module Engine
    class Fingerprint
      OVERRIDE_COP_NAMES = %w[
        Metrics/AbcSize
        Metrics/ClassLength
        Metrics/CyclomaticComplexity
        Metrics/MethodLength
        Metrics/ModuleLength
        Metrics/PerceivedComplexity
      ].freeze

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
        message.gsub(/ \[.+\]$/, "")
      end
    end
  end
end
