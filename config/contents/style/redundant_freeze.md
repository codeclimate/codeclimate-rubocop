This cop check for uses of Object#freeze on immutable objects.

### Example:
    # bad
    CONST = 1.freeze

    # good
    CONST = 1