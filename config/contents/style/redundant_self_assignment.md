This cop checks for places where redundant assignments are made for in place
modification methods.

### Safety:

This cop is unsafe, because it can produce false positives for
user defined methods having one of the expected names, but not modifying
its receiver in place.

### Example:
    # bad
    args = args.concat(ary)
    hash = hash.merge!(other)

    # good
    args.concat(foo)
    args += foo
    hash.merge!(other)

    # bad
    self.foo = foo.concat(ary)

    # good
    foo.concat(ary)
    self.foo += ary
