Checks for ambiguous operators in the first argument of a
method invocation without parentheses.

### Example:

    # bad

    # The `*` is interpreted as a splat operator but it could possibly be
    # a `*` method invocation (i.e. `do_something.*(some_array)`).
    do_something *some_array

### Example:

    # good

    # With parentheses, there's no ambiguity.
    do_something(*some_array)