Checks for spaces inside ordinary round parentheses.

### Example: EnforcedStyle: no_space (default)
    # The `no_space` style enforces that parentheses do not have spaces.

    # bad
    f( 3)
    g = (a + 3 )

    # good
    f(3)
    g = (a + 3)

### Example: EnforcedStyle: space
    # The `space` style enforces that parentheses have a space at the
    # beginning and end.
    # Note: Empty parentheses should not have spaces.

    # bad
    f(3)
    g = (a + 3)
    y( )

    # good
    f( 3 )
    g = ( a + 3 )
    y()
