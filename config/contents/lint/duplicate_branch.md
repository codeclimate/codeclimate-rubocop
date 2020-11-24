This cop checks that there are no repeated bodies
within `if/unless`, `case-when` and `rescue` constructs.

### Example:
    # bad
    if foo
      do_foo
      do_something_else
    elsif bar
      do_foo
      do_something_else
    end

    # good
    if foo || bar
      do_foo
      do_something_else
    end

    # bad
    case x
    when foo
      do_foo
    when bar
      do_foo
    else
      do_something_else
    end

    # good
    case x
    when foo, bar
      do_foo
    else
      do_something_else
    end

    # bad
    begin
      do_something
    rescue FooError
      handle_error
    rescue BarError
      handle_error
    end

    # good
    begin
      do_something
    rescue FooError, BarError
      handle_error
    end
