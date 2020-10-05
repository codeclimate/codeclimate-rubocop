This cop checks for multi-line ternary op expressions.

NOTE: `return if ... else ... end` is syntax error. If `return` is used before
multiline ternary operator expression, it cannot be auto-corrected.

### Example:
    # bad
    a = cond ?
      b : c
    a = cond ? b :
        c
    a = cond ?
        b :
        c

    # good
    a = cond ? b : c
    a = if cond
      b
    else
      c
    end