This cop checks for multi-line ternary op expressions.

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
    a =
      if cond
        b
      else
        c
      end