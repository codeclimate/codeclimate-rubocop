This cop enforces the use of either `#alias` or `#alias_method`
depending on configuration.
It also flags uses of `alias :symbol` rather than `alias bareword`.

### Example: EnforcedStyle: prefer_alias (default)
    # bad
    alias_method :bar, :foo
    alias :bar :foo

    # good
    alias bar foo

### Example: EnforcedStyle: prefer_alias_method
    # bad
    alias :bar :foo
    alias bar foo

    # good
    alias_method :bar, :foo