Checks for comma (,) not followed by some kind of space.

### Example:

    # bad
    [1,2]
    { foo:bar,}

    # good
    [1, 2]
    { foo:bar, }