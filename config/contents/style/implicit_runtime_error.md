Checks for `raise` or `fail` statements which do not specify an
explicit exception class. (This raises a `RuntimeError`. Some projects
might prefer to use exception classes which more precisely identify the
nature of the error.)

### Example:
    # bad
    raise 'Error message here'

    # good
    raise ArgumentError, 'Error message here'