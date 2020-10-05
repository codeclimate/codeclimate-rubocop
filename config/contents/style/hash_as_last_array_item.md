Checks for presence or absence of braces around hash literal as a last
array item depending on configuration.

NOTE: This cop will ignore arrays where all items are hashes, regardless of
EnforcedStyle.

### Example: EnforcedStyle: braces (default)
    # bad
    [1, 2, one: 1, two: 2]

    # good
    [1, 2, { one: 1, two: 2 }]

    # good
    [{ one: 1 }, { two: 2 }]

### Example: EnforcedStyle: no_braces
    # bad
    [1, 2, { one: 1, two: 2 }]

    # good
    [1, 2, one: 1, two: 2]

    # good
    [{ one: 1 }, { two: 2 }]