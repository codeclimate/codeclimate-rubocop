This cop checks for string conversion in string interpolation,
which is redundant.

### Example:

    # bad

    "result is #{something.to_s}"

### Example:

    # good

    "result is #{something}"