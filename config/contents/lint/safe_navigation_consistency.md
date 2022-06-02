Check to make sure that if safe navigation is used for a method
call in an `&&` or `||` condition that safe navigation is used for all
method calls on that same object.

### Example:
    # bad
    foo&.bar && foo.baz

    # bad
    foo.bar || foo&.baz

    # bad
    foo&.bar && (foobar.baz || foo.baz)

    # good
    foo.bar && foo.baz

    # good
    foo&.bar || foo&.baz

    # good
    foo&.bar && (foobar.baz || foo&.baz)
