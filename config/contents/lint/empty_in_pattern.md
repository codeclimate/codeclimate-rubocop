Checks for the presence of `in` pattern branches without a body.

### Example:

    # bad
    case condition
    in [a]
      do_something
    in [a, b]
    end

    # good
    case condition
    in [a]
      do_something
    in [a, b]
      nil
    end

### Example: AllowComments: true (default)

    # good
    case condition
    in [a]
      do_something
    in [a, b]
      # noop
    end

### Example: AllowComments: false

    # bad
    case condition
    in [a]
      do_something
    in [a, b]
      # noop
    end
