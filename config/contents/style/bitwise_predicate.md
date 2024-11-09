Prefer bitwise predicate methods over direct comparison operations.

### Safety:

This cop is unsafe, as it can produce false positives if the receiver
is not an `Integer` object.

### Example:

    # bad - checks any set bits
    (variable & flags).positive?

    # good
    variable.anybits?(flags)

    # bad - checks all set bits
    (variable & flags) == flags

    # good
    variable.allbits?(flags)

    # bad - checks no set bits
    (variable & flags).zero?

    # good
    variable.nobits?(flags)
