Access modifiers should be surrounded by blank lines.

### Example: EnforcedStyle: around (default)

    # bad
    class Foo
      def bar; end
      private
      def baz; end
    end

    # good
    class Foo
      def bar; end

      private

      def baz; end
    end

### Example: EnforcedStyle: only_before

    # bad
    class Foo
      def bar; end
      private
      def baz; end
    end

    # good
    class Foo
      def bar; end

      private
      def baz; end
    end
