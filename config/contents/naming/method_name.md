This cop makes sure that all methods use the configured style,
snake_case or camelCase, for their names.

### Example: EnforcedStyle: snake_case (default)
    # bad
    def fooBar; end

    # good
    def foo_bar; end

### Example: EnforcedStyle: camelCase
    # bad
    def foo_bar; end

    # good
    def fooBar; end