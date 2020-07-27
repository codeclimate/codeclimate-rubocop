Checks for presence or absence of braces around hash literal as a last
array item depending on configuration.

### Example: EnforcedStyle: braces (default)
    # bad
    [1, 2, one: 1, two: 2]

    # good
    [1, 2, { one: 1, two: 2 }]

### Example: EnforcedStyle: no_braces
    # bad
    [1, 2, { one: 1, two: 2 }]

    # good
    [1, 2, one: 1, two: 2]
