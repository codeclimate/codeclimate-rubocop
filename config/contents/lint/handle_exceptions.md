This cop checks for *rescue* blocks with no body.

### Example:

    # bad

    def some_method
      do_something
    rescue
      # do nothing
    end

### Example:

    # bad

    begin
      do_something
    rescue
      # do nothing
    end

### Example:

    # good

    def some_method
      do_something
    rescue
      handle_exception
    end

### Example:

    # good

    begin
      do_something
    rescue
      handle_exception
    end