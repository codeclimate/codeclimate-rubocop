This cop checks the indentation of the right hand side operand in
binary operations that span more than one line.

### Example:
    # bad
    if a +
    b
      something
    end