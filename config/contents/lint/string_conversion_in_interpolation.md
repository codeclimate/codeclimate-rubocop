This cop checks for string conversion in string interpolation,
which is redundant.

### Example:

    "result is #{something.to_s}"