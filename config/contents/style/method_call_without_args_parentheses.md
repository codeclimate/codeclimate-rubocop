Checks for unwanted parentheses in parameterless method calls.

This cop can be customized ignored methods with `IgnoredMethods`.
By default, there are no methods to ignored.

### Example:
    # bad
    object.some_method()

    # good
    object.some_method

### Example: IgnoredMethods: [] (default)
    # bad
    object.foo()

### Example: IgnoredMethods: [foo]
    # good
    object.foo()
