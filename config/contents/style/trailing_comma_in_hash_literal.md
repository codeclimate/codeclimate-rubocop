This cop checks for trailing comma in hash literals.

### Example: EnforcedStyleForMultiline: consistent_comma
    # bad
    a = { foo: 1, bar: 2, }

    # good
    a = {
      foo: 1, bar: 2,
      qux: 3,
    }

    # good
    a = {
      foo: 1,
      bar: 2,
    }

### Example: EnforcedStyleForMultiline: comma
    # bad
    a = { foo: 1, bar: 2, }

    # good
    a = {
      foo: 1,
      bar: 2,
    }

### Example: EnforcedStyleForMultiline: no_comma (default)
    # bad
    a = { foo: 1, bar: 2, }

    # good
    a = {
      foo: 1,
      bar: 2
    }