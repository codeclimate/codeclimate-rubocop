Checks the indentation of the right hand side operand in binary operations that
span more than one line.

The `aligned` style checks that operators are aligned if they are part of an `if` or `while`
condition, an explicit `return` statement, etc. In other contexts, the second operand should
be indented regardless of enforced style.

### Example: EnforcedStyle: aligned (default)
    # bad
    if a +
        b
      something &&
      something_else
    end

    # good
    if a +
       b
      something &&
        something_else
    end

### Example: EnforcedStyle: indented
    # bad
    if a +
       b
      something &&
      something_else
    end

    # good
    if a +
        b
      something &&
        something_else
    end
