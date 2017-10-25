Access modifiers should be surrounded by blank lines.

### Example:

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