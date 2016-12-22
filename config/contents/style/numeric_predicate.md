This cop checks for usage of comparison operators (`==`,
`>`, `<`) to test numbers as zero, positive, or negative.
These can be replaced by their respective predicate methods.
The cop can also be configured to do the reverse.

The cop disregards `nonzero?` as it its value is truthy or falsey,
but not `true` and `false`, and thus not always interchangeable with
`!= 0`.

### Example:

    # EnforcedStyle: predicate (default)

    # bad

    foo == 0
    0 > foo
    bar.baz > 0

    # good

    foo.zero?
    foo.negative?
    bar.baz.positive?

### Example:

    # EnforcedStyle: comparison

    # bad

    foo.zero?
    foo.negative?
    bar.baz.positive?

    # good

    foo == 0
    0 > foo
    bar.baz > 0