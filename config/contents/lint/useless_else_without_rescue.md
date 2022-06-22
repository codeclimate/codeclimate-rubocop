Checks for useless `else` in `begin..end` without `rescue`.

NOTE: This syntax is no longer valid on Ruby 2.6 or higher.

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