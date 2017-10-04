Use a consistent style for named format string tokens.

### Example:

    EnforcedStyle: annotated

    # bad

    format('%{greeting}', greeting: 'Hello')
    format('%s', 'Hello')

    # good

    format('%<greeting>s', greeting: 'Hello')

### Example:

    EnforcedStyle: template

    # bad

    format('%<greeting>s', greeting: 'Hello')
    format('%s', 'Hello')

    # good

    format('%{greeting}', greeting: 'Hello')