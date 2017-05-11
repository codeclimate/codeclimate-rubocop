This cop checks for useless `else` in `begin..end` without `rescue`.

### Example:

    # bad

    begin
      do_something
    else
      do_something_else # This will never be run.
    end

### Example:

    # good

    begin
      do_something
    rescue
      handle_errors
    else
      do_something_else
    end