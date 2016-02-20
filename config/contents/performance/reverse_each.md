This cop is used to identify usages of `reverse.each` and
change them to use `reverse_each` instead.

### Example:
    # bad
    [].reverse.each

    # good
    [].reverse_each