This cop enforces the use of either `#alias` or `#alias_method`
depending on configuration.
It also flags uses of `alias :symbol` rather than `alias bareword`.

### Example:

    # EnforcedStyle: prefer_alias

    # good
    alias bar foo

    # bad
    alias_method :bar, :foo
    alias :bar :foo

### Example:

    # EnforcedStyle: prefer_alias_method

    # good
    alias_method :bar, :foo

    # bad
    alias bar foo