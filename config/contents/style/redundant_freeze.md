This cop check for uses of `Object#freeze` on immutable objects.

NOTE: Regexp and Range literals are frozen objects since Ruby 3.0.

### Example:
    # bad
    CONST = 1.freeze

    # good
    CONST = 1