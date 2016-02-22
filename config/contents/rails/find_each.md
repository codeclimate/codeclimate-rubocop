This cop is used to identify usages of `all.each` and
change them to use `all.find_each` instead.

### Example:
    # bad
    User.all.each

    # good
    User.all.find_each