Checks for the presence of `when` branches without a body.

### Example:

    # bad
    case foo
    when bar
      do_something
    when baz
    end

### Example:

    # good
    case condition
    when foo
      do_something
    when bar
      nil
    end

### Example: AllowComments: true (default)

    # good
    case condition
    when foo
      do_something
    when bar
      # noop
    end

### Example: AllowComments: false

    # bad
    case condition
    when foo
      do_something
    when bar
      # do nothing
    end
