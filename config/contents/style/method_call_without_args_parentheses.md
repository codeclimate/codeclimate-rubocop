Checks for unwanted parentheses in parameterless method calls.

This cop's allowed methods can be customized with `AllowedMethods`.
By default, there are no allowed methods.

NOTE: This cop allows the use of `it()` without arguments in blocks,
as in `0.times { it() }`, following `Lint/ItWithoutArgumentsInBlock` cop.

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
