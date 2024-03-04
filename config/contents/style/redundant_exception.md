Checks for RuntimeError as the argument of raise/fail.

### Example:
    # bad
    raise RuntimeError, 'message'
    raise RuntimeError.new('message')

    # good
    raise 'message'

    # bad - message is not a string
    raise RuntimeError, Object.new
    raise RuntimeError.new(Object.new)

    # good
    raise Object.new.to_s
