Checks for potential uses of `Enumerable#minmax`.

### Example:

    # bad
    bar = [foo.min, foo.max]
    return foo.min, foo.max

    # good
    bar = foo.minmax
    return foo.minmax