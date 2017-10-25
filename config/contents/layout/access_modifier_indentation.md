Modifiers should be indented as deep as method definitions, or as deep
as the class/module keyword, depending on configuration.

### Example:
    # EnforcedStyle: indent (default)

    # bad
    class Plumbus
    private
      def smooth; end
    end

    # good
    class Plumbus
      private
      def smooth; end
    end

    # EnforcedStyle: outdent

    # bad
    class Plumbus
      private
      def smooth; end
    end

    # good
    class Plumbus
    private
      def smooth; end
    end