Checks for unparenthesized method calls in the argument list
of a parenthesized method call.

### Example:
    # good
    method1(method2(arg))

    # bad
    method1(method2 arg)