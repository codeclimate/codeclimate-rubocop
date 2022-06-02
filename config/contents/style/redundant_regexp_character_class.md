Checks for unnecessary single-element Regexp character classes.

### Example:

    # bad
    r = /[x]/

    # good
    r = /x/

    # bad
    r = /[\s]/

    # good
    r = /\s/

    # bad
    r = %r{/[b]}

    # good
    r = %r{/b}

    # good
    r = /[ab]/