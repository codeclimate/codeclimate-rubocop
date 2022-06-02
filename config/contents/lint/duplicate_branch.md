Checks that there are no repeated bodies
within `if/unless`, `case-when`, `case-in` and `rescue` constructs.

With `IgnoreLiteralBranches: true`, branches are not registered
as offenses if they return a basic literal value (string, symbol,
integer, float, rational, complex, `true`, `false`, or `nil`), or
return an array, hash, regexp or range that only contains one of
the above basic literal values.

With `IgnoreConstantBranches: true`, branches are not registered
as offenses if they return a constant value.

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

### Example: IgnoreLiteralBranches: true
    # good
    case size
    when "small" then 100
    when "medium" then 250
    when "large" then 1000
    else 250
    end

### Example: IgnoreConstantBranches: true
    # good
    case size
    when "small" then SMALL_SIZE
    when "medium" then MEDIUM_SIZE
    when "large" then LARGE_SIZE
    else MEDIUM_SIZE
    end
