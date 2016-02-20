This cop makes sure that predicates are named properly.

### Example:
    # bad
    def is_even?(value) ...

    # good
    def even?(value)

    # bad
    def has_value? ...

    # good
    def value? ...