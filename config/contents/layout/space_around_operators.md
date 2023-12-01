Checks that operators have space around them, except for ** which
should or shouldn't have surrounding space depending on configuration.
It allows vertical alignment consisting of one or more whitespace
around operators.

This cop has `AllowForAlignment` option. When `true`, allows most
uses of extra spacing if the intent is to align with an operator on
the previous or next line, not counting empty lines or comment lines.

### Example:
    # bad
    total = 3*4
    "apple"+"juice"
    my_number = 38/4

    # good
    total = 3 * 4
    "apple" + "juice"
    my_number = 38 / 4

### Example: AllowForAlignment: true (default)
    # good
    {
      1 =>  2,
      11 => 3
    }

### Example: AllowForAlignment: false
    # bad
    {
      1 =>  2,
      11 => 3
    }

### Example: EnforcedStyleForExponentOperator: no_space (default)
    # bad
    a ** b

    # good
    a**b

### Example: EnforcedStyleForExponentOperator: space
    # bad
    a**b

    # good
    a ** b

### Example: EnforcedStyleForRationalLiterals: no_space (default)
    # bad
    1 / 48r

    # good
    1/48r

### Example: EnforcedStyleForRationalLiterals: space
    # bad
    1/48r

    # good
    1 / 48r