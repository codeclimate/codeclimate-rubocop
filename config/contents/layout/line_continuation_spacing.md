Checks that the backslash of a line continuation is separated from
preceding text by exactly one space (default) or zero spaces.

### Example: EnforcedStyle: space (default)
    # bad
    'a'\
    'b'  \
    'c'

    # good
    'a' \
    'b' \
    'c'

### Example: EnforcedStyle: no_space
    # bad
    'a' \
    'b'  \
    'c'

    # good
    'a'\
    'b'\
    'c'