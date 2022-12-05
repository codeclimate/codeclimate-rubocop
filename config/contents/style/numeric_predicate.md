Checks for usage of comparison operators (`==`,
`>`, `<`) to test numbers as zero, positive, or negative.
These can be replaced by their respective predicate methods.
This cop can also be configured to do the reverse.

This cop can be customized ignored methods with `IgnoredMethods`.
By default, there are no methods to ignored.

This cop disregards `#nonzero?` as its value is truthy or falsey,
but not `true` and `false`, and thus not always interchangeable with
`!= 0`.

This cop ignores comparisons to global variables, since they are often
populated with objects which can be compared with integers, but are
not themselves `Integer` polymorphic.

### Safety:

This cop is unsafe because it cannot be guaranteed that the receiver
defines the predicates or can be compared to a number, which may lead
to a false positive for non-standard classes.

### Example: EnforcedStyle: predicate (default)
    # bad
    foo == 0
    0 > foo
    bar.baz > 0

    # good
    foo.zero?
    foo.negative?
    bar.baz.positive?

### Example: EnforcedStyle: comparison
    # bad
    foo.zero?
    foo.negative?
    bar.baz.positive?

    # good
    foo == 0
    0 > foo
    bar.baz > 0

### Example: IgnoredMethods: [] (default) with EnforcedStyle: predicate
    # bad
    foo == 0
    0 > foo
    bar.baz > 0

### Example: IgnoredMethods: [==] with EnforcedStyle: predicate
    # good
    foo == 0

    # bad
    0 > foo
    bar.baz > 0
