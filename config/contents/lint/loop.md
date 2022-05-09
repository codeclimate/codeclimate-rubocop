This cop checks for uses of `begin...end while/until something`.

### Safety:

The cop is unsafe because behavior can change in some cases, including
if a local variable inside the loop body is accessed outside of it, or if the
loop body raises a `StopIteration` exception (which `Kernel#loop` rescues).

### Example:

    # bad

    # using while
    begin
      do_something
    end while some_condition

### Example:

    # bad

    # using until
    begin
      do_something
    end until some_condition

### Example:

    # good

    # while replacement
    loop do
      do_something
      break unless some_condition
    end

### Example:

    # good

    # until replacement
    loop do
      do_something
      break if some_condition
    end