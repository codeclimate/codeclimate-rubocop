Access modifiers should be declared to apply to a group of methods
or inline before each method, depending on configuration.
EnforcedStyle config covers only method definitions.
Applications of visibility methods to symbols can be controlled
using AllowModifiersOnSymbols config.

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

### Example: AllowModifiersOnSymbols: true (default)
    # good
    class Foo

      private :bar, :baz

    end

### Example: AllowModifiersOnSymbols: false
    # bad
    class Foo

      private :bar, :baz

    end