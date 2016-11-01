Checks for uses of if/unless modifiers with multiple-lines bodies.

### Example:

    # bad
    {
      result: 'this should not happen'
    } unless cond

    # good
    { result: 'ok' } if cond