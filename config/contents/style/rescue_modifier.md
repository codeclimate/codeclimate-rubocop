This cop checks for uses of rescue in its modifier form.

### Example:
    # bad
    some_method rescue handle_error

    # good
    begin
      some_method
    rescue
      handle_error
    end