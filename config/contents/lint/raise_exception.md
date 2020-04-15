This cop checks for `raise` or `fail` statements which are
raising `Exception` class.

### Example:
    # bad
    raise Exception, 'Error message here'

    # good
    raise StandardError, 'Error message here'