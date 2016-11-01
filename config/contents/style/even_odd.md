This cop checks for places where Integer#even? or Integer#odd?
should have been used.

### Example:

    # bad
    if x % 2 == 0

    # good
    if x.even?