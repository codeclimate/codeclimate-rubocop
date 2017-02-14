This cop checks for ambiguous operators in the first argument of a
method invocation without parentheses.

### Example:
    array = [1, 2, 3]

    # The `*` is interpreted as a splat operator but it could possibly be
    # a `*` method invocation (i.e. `do_something.*(array)`).
    do_something *array

    # With parentheses, there's no ambiguity.
    do_something(*array)