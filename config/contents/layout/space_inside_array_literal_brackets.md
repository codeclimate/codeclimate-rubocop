Checks that brackets used for array literals have or don't have
surrounding space depending on configuration.

### Example: EnforcedStyle: space
    # The `space` style enforces that array literals have
    # surrounding space.

    # bad
    array = [a, b, c, d]

    # good
    array = [ a, b, c, d ]

### Example: EnforcedStyle: no_space
    # The `no_space` style enforces that array literals have
    # no surrounding space.

    # bad
    array = [ a, b, c, d ]

    # good
    array = [a, b, c, d]

### Example: EnforcedStyle: compact
    # The `compact` style normally requires a space inside
    # array brackets, with the exception that successive left
    # or right brackets are collapsed together in nested arrays.

    # bad
    array = [ a, [ b, c ] ]

    # good
    array = [ a, [ b, c ]]