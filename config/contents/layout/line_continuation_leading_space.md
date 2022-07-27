Checks that strings broken over multiple lines (by a backslash) contain
trailing spaces instead of leading spaces (default) or leading spaces
instead of trailing spaces.

### Example: EnforcedStyle: trailing (default)
    # bad
    'this text contains a lot of' \
    '               spaces'

    # good
    'this text contains a lot of               ' \
    'spaces'

    # bad
    'this text is too' \
    ' long'

    # good
    'this text is too ' \
    'long'

### Example: EnforcedStyle: leading
    # bad
    'this text contains a lot of               ' \
    'spaces'

    # good
    'this text contains a lot of' \
    '               spaces'

    # bad
    'this text is too ' \
    'long'

    # good
    'this text is too' \
    ' long'