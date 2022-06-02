Checks for unnecessary conditional expressions.

### Example:
    # bad
    a = b ? b : c

    # good
    a = b || c

### Example:
    # bad
    if b
      b
    else
      c
    end

    # good
    b || c

    # good
    if b
      b
    elsif cond
      c
    end
