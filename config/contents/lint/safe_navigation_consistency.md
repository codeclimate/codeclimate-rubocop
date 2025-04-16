Check to make sure that if safe navigation is used in an `&&` or `||` condition,
consistent and appropriate safe navigation, without excess or deficiency,
is used for all method calls on the same object.

### Example:
    # bad
    foo&.bar && foo&.baz

    # good
    foo&.bar && foo.baz

    # bad
    foo.bar && foo&.baz

    # good
    foo.bar && foo.baz

    # bad
    foo&.bar || foo.baz

    # good
    foo&.bar || foo&.baz

    # bad
    foo.bar || foo&.baz

    # good
    foo.bar || foo.baz

    # bad
    foo&.bar && (foobar.baz || foo&.baz)

    # good
    foo&.bar && (foobar.baz || foo.baz)
