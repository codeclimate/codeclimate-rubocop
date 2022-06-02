Checks for a rescued exception that get shadowed by a
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

    # good

    begin
      something
    rescue StandardError
      handle_standard_error
    rescue Exception
      handle_exception
    end

    # good, however depending on runtime environment.
    #
    # This is a special case for system call errors.
    # System dependent error code depends on runtime environment.
    # For example, whether `Errno::EAGAIN` and `Errno::EWOULDBLOCK` are
    # the same error code or different error code depends on environment.
    # This good case is for `Errno::EAGAIN` and `Errno::EWOULDBLOCK` with
    # the same error code.
    begin
      something
    rescue Errno::EAGAIN, Errno::EWOULDBLOCK
      handle_standard_error
    end
