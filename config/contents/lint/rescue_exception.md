Checks for `rescue` blocks targeting the `Exception` class.

### Example:

    # bad
    begin
      do_something
    rescue Exception
      handle_exception
    end

    # good
    begin
      do_something
    rescue ArgumentError
      handle_exception
    end