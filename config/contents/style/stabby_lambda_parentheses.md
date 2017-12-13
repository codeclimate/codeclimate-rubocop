Check for parentheses around stabby lambda arguments.
There are two different styles. Defaults to `require_parentheses`.

### Example: EnforcedStyle: require_parentheses (default)
    # bad
    ->a,b,c { a + b + c }

    # good
    ->(a,b,c) { a + b + c}

### Example: EnforcedStyle: require_no_parentheses
    # bad
    ->(a,b,c) { a + b + c }

    # good
    ->a,b,c { a + b + c}