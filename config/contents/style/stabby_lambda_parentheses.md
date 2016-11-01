Check for parentheses around stabby lambda arguments.
There are two different styles. Defaults to `require_parentheses`.

### Example:
    # require_parentheses - bad
    ->a,b,c { a + b + c }

    # require_parentheses - good
    ->(a,b,c) { a + b + c}

    # require_no_parentheses - bad
    ->(a,b,c) { a + b + c }

    # require_no_parentheses - good
    ->a,b,c { a + b + c}