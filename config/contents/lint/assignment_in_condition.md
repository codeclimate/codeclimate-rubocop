This cop checks for assignments in the conditions of
if/while/until.

### Example:

    # bad

    if some_var = true
      do_something
    end

### Example:

    # good

    if some_var == true
      do_something
    end