Avoid redundant `::` prefix on constant.

How Ruby searches constant is a bit complicated, and it can often be difficult to
understand from the code whether the `::` is intended or not. Where `Module.nesting`
is empty, there is no need to prepend `::`, so it would be nice to consistently
avoid such meaningless `::` prefix to avoid confusion.

NOTE: This cop is disabled if `Lint/ConstantResolution` cop is enabled to prevent
conflicting rules. Because it respects user configurations that want to enable
`Lint/ConstantResolution` cop which is disabled by default.

### Example:
    # bad
    ::Const

    # good
    Const

    # bad
    class << self
      ::Const
    end

    # good
    class << self
      Const
    end

    # good
    class A
      ::Const
    end

    # good
    module A
      ::Const
    end