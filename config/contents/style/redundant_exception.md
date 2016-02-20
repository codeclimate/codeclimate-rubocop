This cop checks for RuntimeError as the argument of raise/fail.

Currently it checks for code like this:

### Example:

    raise RuntimeError, 'message'