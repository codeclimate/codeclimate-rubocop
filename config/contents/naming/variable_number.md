This cop makes sure that all numbered variables use the
configured style, snake_case, normalcase, or non_integer,
for their numbering.

### Example: EnforcedStyle: snake_case
    # bad

    variable1 = 1

    # good

    variable_1 = 1

### Example: EnforcedStyle: normalcase (default)
    # bad

    variable_1 = 1

    # good

    variable1 = 1

### Example: EnforcedStyle: non_integer
    # bad

    variable1 = 1

    variable_1 = 1

    # good

    variableone = 1

    variable_one = 1