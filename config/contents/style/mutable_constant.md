This cop checks whether some constant value isn't a
mutable literal (e.g. array or hash).

### Example:
    # bad
    CONST = [1, 2, 3]

    # good
    CONST = [1, 2, 3].freeze