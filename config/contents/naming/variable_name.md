Checks that the configured style (snake_case or camelCase) is used for all variable names.
This includes local variables, instance variables, class variables, method arguments
(positional, keyword, rest or block), and block arguments.

The cop can also be configured to forbid using specific names for variables, using
`ForbiddenIdentifiers` or `ForbiddenPatterns`. In addition to the above, this applies
to global variables as well.

Method definitions and method calls are not affected by this cop.

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
    release_v1 = true

### Example: ForbiddenIdentifiers: ['fooBar']
    # bad (in all cases)
    fooBar = 1
    @fooBar = 1
    @@fooBar = 1
    $fooBar = 1

### Example: ForbiddenPatterns: ['_v\d+\z']
    # bad (in all cases)
    release_v1 = true
    @release_v1 = true
    @@release_v1 = true
    $release_v1 = true
