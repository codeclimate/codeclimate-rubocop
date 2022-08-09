Checks for unwanted parentheses in parameterless method calls.

This cop can be customized allowed methods with `AllowedMethods`.
By default, there are no methods to allowed.

### Example:
    # bad
    object.some_method()

    # good
    object.some_method

### Example: AllowedMethods: [] (default)
    # bad
    object.foo()

### Example: AllowedMethods: [foo]
    # good
    object.foo()
