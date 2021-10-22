Checks for spaces inside ordinary round parentheses.

### Example: EnforcedStyle: no_space (default)
    # The `no_space` style enforces that parentheses do not have spaces.

    # bad
    f( 3)
    g = (a + 3 )
    f( )

    # good
    f(3)
    g = (a + 3)
    f()

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

### Example: EnforcedStyle: compact
    # The `compact` style enforces that parentheses have a space at the
    # beginning with the exception that successive parentheses are allowed.
    # Note: Empty parentheses should not have spaces.

    # bad
    f(3)
    g = (a + 3)
    y( )
    g( f( x ) )
    g( f( x( 3 ) ), 5 )
    g( ( ( 3 + 5 ) * f) ** x, 5 )

    # good
    f( 3 )
    g = ( a + 3 )
    y()
    g( f( x ))
    g( f( x( 3 )), 5 )
    g((( 3 + 5 ) * f ) ** x, 5 )
