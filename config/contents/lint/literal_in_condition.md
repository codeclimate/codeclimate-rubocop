This cop checks for literals used as the conditions or as
operands in and/or expressions serving as the conditions of
if/while/until.

### Example:

    if 20
      do_something
    end

    if some_var && true
      do_something
    end
