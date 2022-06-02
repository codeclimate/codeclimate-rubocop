Enforces that Ruby source files are not empty.

### Example:
    # bad
    # Empty file

    # good
    # File containing non commented source lines

### Example: AllowComments: true (default)
    # good
    # File consisting only of comments

### Example: AllowComments: false
    # bad
    # File consisting only of comments
