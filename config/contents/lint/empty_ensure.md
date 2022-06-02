Checks for empty `ensure` blocks

### Example:

    # bad

    def some_method
      do_something
    ensure
    end

### Example:

    # bad

    begin
      do_something
    ensure
    end

### Example:

    # good

    def some_method
      do_something
    ensure
      do_something_else
    end

### Example:

    # good

    begin
      do_something
    ensure
      do_something_else
    end