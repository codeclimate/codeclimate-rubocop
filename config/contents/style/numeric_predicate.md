This cop checks for usage of comparison operators (`==`, `!=`,
`>`, `<`) to test numbers as zero, nonzero, positive, or negative.
These can be replaced by their respective predicate methods.
The cop can also be configured to do the reverse.

### Example:

    # EnforcedStyle: predicate (default)

    # bad

    foo == 0
    0 != bar.baz
    0 > foo
    bar.baz > 0

    # good

    foo.zero?
    bar.baz.nonzero?
    foo.negative?
    bar.baz.positive?

### Example:

    # EnforcedStyle: comparison

    # bad

    foo.zero?
    bar.baz.nonzero?
    foo.negative?
    bar.baz.positive?

    # good

    foo == 0
    0 != bar.baz
    0 > foo
    bar.baz > 0