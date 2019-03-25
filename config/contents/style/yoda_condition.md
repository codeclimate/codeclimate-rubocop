This cop can either enforce or forbid Yoda conditions,
i.e. comparison operations where the order of expression is reversed.
eg. `5 == x`

### Example: EnforcedStyle: forbid_for_all_comparison_operators (default)
    # bad
    99 == foo
    "bar" != foo
    42 >= foo
    10 < bar

    # good
    foo == 99
    foo == "bar"
    foo <= 42
    bar > 10

### Example: EnforcedStyle: forbid_for_equality_operators_only
    # bad
    99 == foo
    "bar" != foo

    # good
    99 >= foo
    3 < a && a < 5

### Example: EnforcedStyle: require_for_all_comparison_operators
    # bad
    foo == 99
    foo == "bar"
    foo <= 42
    bar > 10

    # good
    99 == foo
    "bar" != foo
    42 >= foo
    10 < bar

### Example: EnforcedStyle: require_for_equality_operators_only
    # bad
    99 >= foo
    3 < a && a < 5

    # good
    99 == foo
    "bar" != foo