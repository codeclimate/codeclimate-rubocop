Checks for multiple expressions placed on the same line.
It also checks for lines terminated with a semicolon.

This cop has `AllowAsExpressionSeparator` configuration option.
It allows `;` to separate several expressions on the same line.

### Example:
    # bad
    foo = 1; bar = 2;
    baz = 3;

    # good
    foo = 1
    bar = 2
    baz = 3

### Example: AllowAsExpressionSeparator: false (default)
    # bad
    foo = 1; bar = 2

### Example: AllowAsExpressionSeparator: true
    # good
    foo = 1; bar = 2