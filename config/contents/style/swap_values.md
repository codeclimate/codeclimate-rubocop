Enforces the use of shorthand-style swapping of 2 variables.

### Safety:

Autocorrection is unsafe, because the temporary variable used to
swap variables will be removed, but may be referred to elsewhere.

### Example:
    # bad
    tmp = x
    x = y
    y = tmp

    # good
    x, y = y, x
