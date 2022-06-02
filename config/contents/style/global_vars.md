Looks for uses of global variables.
It does not report offenses for built-in global variables.
Built-in global variables are allowed by default. Additionally
users can allow additional variables via the AllowedVariables option.

Note that backreferences like $1, $2, etc are not global variables.

### Example:
    # bad
    $foo = 2
    bar = $foo + 5

    # good
    FOO = 2
    foo = 2
    $stdin.read