This cop checks for a rescued exception that get shadowed by a
less specific exception being rescued before a more specific
exception is rescued.

### Example:

    # bad

    begin
      something
    rescue Exception
      handle_exception
    rescue StandardError
      handle_standard_error
    end

### Example:

    # good

    begin
      something
    rescue StandardError
      handle_standard_error
    rescue Exception
      handle_exception
    end