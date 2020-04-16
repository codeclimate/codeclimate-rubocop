This cop checks for uses of *begin...end while/until something*.

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