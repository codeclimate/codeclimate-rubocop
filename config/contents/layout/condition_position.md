Checks for conditions that are not on the same line as
if/while/until.

### Example:

    # bad

    if
      some_condition
      do_something
    end

### Example:

    # good

    if some_condition
      do_something
    end