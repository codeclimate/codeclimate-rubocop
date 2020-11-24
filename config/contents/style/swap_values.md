This cop enforces the use of shorthand-style swapping of 2 variables.
Its autocorrection is marked as unsafe, because it can erroneously remove
the temporary variable which is used later.

### Example:
    # bad
    tmp = x
    x = y
    y = tmp

    # good
    x, y = y, x
