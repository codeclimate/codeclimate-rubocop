Identifies places where `lstrip.rstrip` can be replaced by
`strip`.

### Example:
    # bad
    'abc'.lstrip.rstrip
    'abc'.rstrip.lstrip

    # good
    'abc'.strip