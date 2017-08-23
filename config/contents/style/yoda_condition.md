This cop checks for Yoda conditions, i.e. comparison operations where
readability is reduced because the operands are not ordered the same
way as they would be ordered in spoken English.

### Example:

    # bad
    99 == foo
    "bar" == foo
    42 >= foo

### Example:

    # good
    foo == 99
    foo == "bar"
    for <= 42