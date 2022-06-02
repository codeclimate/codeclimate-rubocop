Checks for duplicate elements in Regexp character classes.

### Example:

    # bad
    r = /[xyx]/

    # bad
    r = /[0-9x0-9]/

    # good
    r = /[xy]/

    # good
    r = /[0-9x]/