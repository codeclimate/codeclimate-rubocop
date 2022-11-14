Use a consistent style for named format string tokens.

NOTE: `unannotated` style cop only works for strings
which are passed as arguments to those methods:
`printf`, `sprintf`, `format`, `%`.
The reason is that _unannotated_ format is very similar
to encoded URLs or Date/Time formatting strings.

This cop can be customized allowed methods with `AllowedMethods`.
By default, there are no methods to allowed.

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
    format('%{greeting}', greeting: 'Hello')

    # good
    format('%s', 'Hello')

It is allowed to contain unannotated token
if the number of them is less than or equals to
`MaxUnannotatedPlaceholdersAllowed`.

### Example: MaxUnannotatedPlaceholdersAllowed: 0

    # bad
    format('%06d', 10)
    format('%s %s.', 'Hello', 'world')

    # good
    format('%<number>06d', number: 10)

### Example: MaxUnannotatedPlaceholdersAllowed: 1 (default)

    # bad
    format('%s %s.', 'Hello', 'world')

    # good
    format('%06d', 10)

### Example: AllowedMethods: [] (default)

    # bad
    redirect('foo/%{bar_id}')

### Example: AllowedMethods: [redirect]

    # good
    redirect('foo/%{bar_id}')

### Example: AllowedPatterns: [] (default)

    # bad
    redirect('foo/%{bar_id}')

### Example: AllowedPatterns: ['redirect']

    # good
    redirect('foo/%{bar_id}')
