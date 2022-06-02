Checks for nested ternary op expressions.

### Example:
    # bad
    a ? (b ? b1 : b2) : a2

    # good
    if a
      b ? b1 : b2
    else
      a2
    end