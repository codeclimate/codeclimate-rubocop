This cop checks for RuntimeError as the argument of raise/fail.

It checks for code like this:

### Example:
    # Bad
    raise RuntimeError, 'message'

    # Bad
    raise RuntimeError.new('message')

    # Good
    raise 'message'