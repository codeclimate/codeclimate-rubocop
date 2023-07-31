Makes sure that all variables use the configured style,
snake_case or camelCase, for their names.

### Example: EnforcedStyle: snake_case (default)
    # bad
    fooBar = 1

    # good
    foo_bar = 1

### Example: EnforcedStyle: camelCase
    # bad
    foo_bar = 1

    # good
    fooBar = 1

### Example: AllowedIdentifiers: ['fooBar']
    # good (with EnforcedStyle: snake_case)
    fooBar = 1

### Example: AllowedPatterns: ['_v\d+\z']
    # good (with EnforcedStyle: camelCase)
    :release_v1
