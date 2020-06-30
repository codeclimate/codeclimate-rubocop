This cop checks for unnecessary single-element Regexp character classes.

### Example:

    # bad
    r = /[x]/

    # good
    r = /x/

    # bad
    r = /[\s]/

    # good
    r = /\s/

    # good
    r = /[ab]/