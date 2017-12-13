Checks that reference brackets have or don't have
surrounding space depending on configuration.

### Example: EnforcedStyle: no_space (default)
    # The `no_space` style enforces that reference brackets have
    # no surrounding space.

    # bad
    hash[ :key ]
    array[ index ]

    # good
    hash[:key]
    array[index]

### Example: EnforcedStyle: space
    # The `space` style enforces that reference brackets have
    # surrounding space.

    # bad
    hash[:key]
    array[index]

    # good
    hash[ :key ]
    array[ index ]