This cop checks the indentation of the right hand side operand in
binary operations that span more than one line.

### Example: EnforcedStyle: aligned (default)
    # bad
    if a +
        b
      something
    end

    # good
    if a +
       b
      something
    end

### Example: EnforcedStyle: indented
    # bad
    if a +
       b
      something
    end

    # good
    if a +
        b
      something
    end
