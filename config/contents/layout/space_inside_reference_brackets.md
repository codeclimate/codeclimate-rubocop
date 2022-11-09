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


### Example: EnforcedStyleForEmptyBrackets: no_space (default)
    # The `no_space` EnforcedStyleForEmptyBrackets style enforces that
    # empty reference brackets do not contain spaces.

    # bad
    foo[ ]
    foo[     ]
    foo[
    ]

    # good
    foo[]

### Example: EnforcedStyleForEmptyBrackets: space
    # The `space` EnforcedStyleForEmptyBrackets style enforces that
    # empty reference brackets contain exactly one space.

    # bad
    foo[]
    foo[    ]
    foo[
    ]

    # good
    foo[ ]
