This cop checks for useless `else` in `begin..end` without `rescue`.

### Example:
    begin
      do_something
    else
      handle_errors # This will never be run.
    end