Use a consistent style for named format string tokens.

**Note:**
`unannotated` style cop only works for strings
which are passed as arguments to those methods:
`sprintf`, `format`, `%`.
The reason is that *unannotated* format is very similar
to encoded URLs or Date/Time formatting strings.

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