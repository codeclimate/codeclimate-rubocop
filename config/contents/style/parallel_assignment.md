Checks for simple usages of parallel assignment.
This will only complain when the number of variables
being assigned matched the number of assigning variables.

### Example:
    # bad
    a, b, c = 1, 2, 3
    a, b, c = [1, 2, 3]

    # good
    one, two = *foo
    a, b = foo()
    a, b = b, a

    a = 1
    b = 2
    c = 3