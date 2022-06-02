Enforces empty line after multiline condition.

### Example:
    # bad
    if multiline &&
      condition
      do_something
    end

    # good
    if multiline &&
      condition

      do_something
    end

    # bad
    case x
    when foo,
      bar
      do_something
    end

    # good
    case x
    when foo,
      bar

      do_something
    end

    # bad
    begin
      do_something
    rescue FooError,
      BarError
      handle_error
    end

    # good
    begin
      do_something
    rescue FooError,
      BarError

      handle_error
    end
