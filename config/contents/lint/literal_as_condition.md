This cop checks for literals used as the conditions or as
operands in and/or expressions serving as the conditions of
if/while/until.

### Example:

    # bad
    if 20
      do_something
    end

    # bad
    if some_var && true
      do_something
    end

    # good
    if some_var && some_condition
      do_something
    end

    # good
    # When using a boolean value for an infinite loop.
    while true
      break if condition
    end