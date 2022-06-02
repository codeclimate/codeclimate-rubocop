Checks for self-assignments.

### Example:
    # bad
    foo = foo
    foo, bar = foo, bar
    Foo = Foo

    # good
    foo = bar
    foo, bar = bar, foo
    Foo = Bar
