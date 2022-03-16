This cop makes sure that all methods use the configured style,
snake_case or camelCase, for their names.

This cop has `AllowedPatterns` configuration option.

    Naming/MethodName:
      AllowedPatterns:
        - '\A\s*onSelectionBulkChange\s*'
        - '\A\s*onSelectionCleared\s*'

Method names matching patterns are always allowed.

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