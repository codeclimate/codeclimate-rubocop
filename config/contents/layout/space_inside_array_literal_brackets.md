Checks that brackets used for array literals have or don't have
surrounding space depending on configuration.

### Example: EnforcedStyle: no_space (default)
    # The `no_space` style enforces that array literals have
    # no surrounding space.

    # bad
    array = [ a, b, c, d ]

    # good
    array = [a, b, c, d]

### Example: EnforcedStyle: space
    # The `space` style enforces that array literals have
    # surrounding space.

    # bad
    array = [a, b, c, d]

    # good
    array = [ a, b, c, d ]

### Example: EnforcedStyle: compact
    # The `compact` style normally requires a space inside
    # array brackets, with the exception that successive left
    # or right brackets are collapsed together in nested arrays.

    # bad
    array = [ a, [ b, c ] ]
    array = [
      [ a ],
      [ b, c ]
    ]

    # good
    array = [ a, [ b, c ]]
    array = [[ a ],
      [ b, c ]]

### Example: EnforcedStyleForEmptyBrackets: no_space (default)
    # The `no_space` EnforcedStyleForEmptyBrackets style enforces that
    # empty array brackets do not contain spaces.

    # bad
    foo = [ ]
    bar = [     ]

    # good
    foo = []
    bar = []

### Example: EnforcedStyleForEmptyBrackets: space
    # The `space` EnforcedStyleForEmptyBrackets style enforces that
    # empty array brackets contain exactly one space.

    # bad
    foo = []
    bar = [    ]

    # good
    foo = [ ]
    bar = [ ]
