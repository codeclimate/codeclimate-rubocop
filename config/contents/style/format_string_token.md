Use a consistent style for named format string tokens.

### Example: EnforcedStyle: annotated (default)

    # bad
    format('%{greeting}', greeting: 'Hello')
    format('%s', 'Hello')

    # good
    format('%<greeting>s', greeting: 'Hello')

### Example: EnforcedStyle: template

    # bad
    format('%<greeting>s', greeting: 'Hello')
    format('%s', 'Hello')

    # good
    format('%{greeting}', greeting: 'Hello')

### Example: EnforcedStyle: unannotated

    # bad
    format('%<greeting>s', greeting: 'Hello')
    format('%{greeting}', 'Hello')

    # good
    format('%s', 'Hello')