Checks for empty `ensure` blocks.

### Example:

    # bad
    def some_method
      do_something
    ensure
    end

    # bad
    begin
      do_something
    ensure
    end

    # good
    def some_method
      do_something
    ensure
      do_something_else
    end

    # good
    begin
      do_something
    ensure
      do_something_else
    end