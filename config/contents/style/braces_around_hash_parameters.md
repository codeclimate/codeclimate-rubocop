This cop checks for braces around the last parameter in a method call
if the last parameter is a hash.
It supports `braces`, `no_braces` and `context_dependent` styles.

### Example: EnforcedStyle: braces
    # The `braces` style enforces braces around all method
    # parameters that are hashes.

    # bad
    some_method(x, y, a: 1, b: 2)

    # good
    some_method(x, y, {a: 1, b: 2})

### Example: EnforcedStyle: no_braces (default)
    # The `no_braces` style checks that the last parameter doesn't
    # have braces around it.

    # bad
    some_method(x, y, {a: 1, b: 2})

    # good
    some_method(x, y, a: 1, b: 2)

### Example: EnforcedStyle: context_dependent
    # The `context_dependent` style checks that the last parameter
    # doesn't have braces around it, but requires braces if the
    # second to last parameter is also a hash literal.

    # bad
    some_method(x, y, {a: 1, b: 2})
    some_method(x, y, {a: 1, b: 2}, a: 1, b: 2)

    # good
    some_method(x, y, a: 1, b: 2)
    some_method(x, y, {a: 1, b: 2}, {a: 1, b: 2})