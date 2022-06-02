Checks for uses of the keyword `not` instead of `!`.

### Example:

    # bad - parentheses are required because of op precedence
    x = (not something)

    # good
    x = !something
