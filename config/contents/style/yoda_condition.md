This cop checks for Yoda conditions, i.e. comparison operations where
readability is reduced because the operands are not ordered the same
way as they would be ordered in spoken English.

### Example: EnforcedStyle: all_comparison_operators (default)
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

### Example: EnforcedStyle: equality_operators_only
    # bad
    99 == foo
    "bar" != foo

    # good
    99 >= foo
    3 < a && a < 5