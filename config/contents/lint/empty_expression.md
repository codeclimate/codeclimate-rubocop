Checks for the presence of empty expressions.

### Example:

    # bad

    foo = ()
    if ()
      bar
    end

    # good

    foo = (some_expression)
    if (some_expression)
      bar
    end