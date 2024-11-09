Access modifiers should be declared to apply to a group of methods
or inline before each method, depending on configuration.
EnforcedStyle config covers only method definitions.
Applications of visibility methods to symbols can be controlled
using AllowModifiersOnSymbols config.
Also, the visibility of `attr*` methods can be controlled using
AllowModifiersOnAttrs config.

In Ruby 3.0, `attr*` methods now return an array of defined method names
as symbols. So we can write the modifier and `attr*` in inline style.
AllowModifiersOnAttrs config allows `attr*` methods to be written in
inline style without modifying applications that have been maintained
for a long time in group style. Furthermore, developers who are not very
familiar with Ruby may know that the modifier applies to `def`, but they
may not know that it also applies to `attr*` methods. It would be easier
to understand if we could write `attr*` methods in inline style.

### Safety:

Autocorrection is not safe, because the visibility of dynamically
defined methods can vary depending on the state determined by
the group access modifier.

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
      private *%i[qux quux]
      private *METHOD_NAMES
      private *private_methods

    end

### Example: AllowModifiersOnSymbols: false
    # bad
    class Foo

      private :bar, :baz
      private *%i[qux quux]
      private *METHOD_NAMES
      private *private_methods

    end

### Example: AllowModifiersOnAttrs: true (default)
    # good
    class Foo

      public attr_reader :bar
      protected attr_writer :baz
      private attr_accessor :qux
      private attr :quux

      def public_method; end

      private

      def private_method; end

    end

### Example: AllowModifiersOnAttrs: false
    # bad
    class Foo

      public attr_reader :bar
      protected attr_writer :baz
      private attr_accessor :qux
      private attr :quux

    end

### Example: AllowModifiersOnAliasMethod: true (default)
    # good
    class Foo

      public alias_method :bar, :foo
      protected alias_method :baz, :foo
      private alias_method :qux, :foo

    end

### Example: AllowModifiersOnAliasMethod: false
    # bad
    class Foo

      public alias_method :bar, :foo
      protected alias_method :baz, :foo
      private alias_method :qux, :foo

    end