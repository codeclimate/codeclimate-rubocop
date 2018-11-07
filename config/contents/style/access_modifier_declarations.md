Access modifiers should be declared to apply to a group of methods
or inline before each method, depending on configuration.

### Example: EnforcedStyle: group (default)

    # bad

    class Foo

      private def bar; end
      private def baz; end

    end

    # good

    class Foo

      private

      def bar; end
      def baz; end

    end
### Example: EnforcedStyle: inline

    # bad

    class Foo

      private

      def bar; end
      def baz; end

    end

    # good

    class Foo

      private def bar; end
      private def baz; end

    end