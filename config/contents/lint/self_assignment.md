Checks for self-assignments.

### Example:
    # bad
    foo = foo
    foo, bar = foo, bar
    Foo = Foo
    hash['foo'] = hash['foo']
    obj.attr = obj.attr

    # good
    foo = bar
    foo, bar = bar, foo
    Foo = Bar
    hash['foo'] = hash['bar']
    obj.attr = obj.attr2

    # good (method calls possibly can return different results)
    hash[foo] = hash[foo]
