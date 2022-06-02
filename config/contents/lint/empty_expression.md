Checks for the presence of empty expressions.

### Example:

    # bad

    foo = ()
    if ()
      bar
    end

### Example:

    # good

    foo = (some_expression)
    if (some_expression)
      bar
    end