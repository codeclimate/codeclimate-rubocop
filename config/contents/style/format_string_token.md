Use a consistent style for tokens within a format string.

By default, all strings are evaluated. In some cases, this may be undesirable,
as they could be used as arguments to a method that does not consider
them to be tokens, but rather other identifiers or just part of the string.

`AllowedMethods` or `AllowedPatterns` can be configured with in order to mark specific
methods as always allowed, thereby avoiding an offense from the cop. By default, there
are no allowed methods.

Additionally, the cop can be made conservative by configuring it with
`Mode: conservative` (default `aggressive`). In this mode, tokens (regardless
of `EnforcedStyle`) are only considered if used in the format string argument to the
methods `printf`, `sprintf`, `format` and `%`.

NOTE: Tokens in the `unannotated` style (eg. `%s`) are always treated as if
configured with `Conservative: true`. This is done in order to prevent false positives,
because this format is very similar to encoded URLs or Date/Time formatting strings.

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

### Example: Mode: conservative, EnforcedStyle: annotated
    # In `conservative` mode, offenses are only registered for strings
    # given to a known formatting method.

    # good
    "%{greeting}"
    foo("%{greeting}")

    # bad
    format("%{greeting}", greeting: 'Hello')
    printf("%{greeting}", greeting: 'Hello')
    sprintf("%{greeting}", greeting: 'Hello')
    "%{greeting}" % { greeting: 'Hello' }
