Checks for grouping of accessors in `class` and `module` bodies.
By default it enforces accessors to be placed in grouped declarations,
but it can be configured to enforce separating them in multiple declarations.

NOTE: If there is a method call before the accessor method it is always allowed
as it might be intended like Sorbet.

### Example: EnforcedStyle: grouped (default)
    # bad
    class Foo
      attr_reader :bar
      attr_reader :baz
    end

    # good
    class Foo
      attr_reader :bar, :baz
    end

### Example: EnforcedStyle: separated
    # bad
    class Foo
      attr_reader :bar, :baz
    end

    # good
    class Foo
      attr_reader :bar
      attr_reader :baz
    end
