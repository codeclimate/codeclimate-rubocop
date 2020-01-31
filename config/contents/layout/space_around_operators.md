Checks that operators have space around them, except for ** which
should or shouldn't have surrounding space depending on configuration.

### Example:
    # bad
    total = 3*4
    "apple"+"juice"
    my_number = 38/4

    # good
    total = 3 * 4
    "apple" + "juice"
    my_number = 38 / 4

### Example: EnforcedStyleForExponentOperator: no_space (default)
    # bad
    a ** b

    # good
    a**b

### Example: EnforcedStyleForExponentOperator: space
    # bad
    a**b

    # good
    a ** b