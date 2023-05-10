Checks for a line break before the first argument in a
multi-line method call.

### Example:

    # bad
    method(foo, bar,
      baz)

    # good
    method(
      foo, bar,
      baz)

      # ignored
      method foo, bar,
        baz

### Example: AllowMultilineFinalElement: false (default)

    # bad
    method(foo, bar, {
      baz: "a",
      qux: "b",
    })

    # good
    method(
      foo, bar, {
      baz: "a",
      qux: "b",
    })

### Example: AllowMultilineFinalElement: true

    # bad
    method(foo,
      bar,
      {
        baz: "a",
        qux: "b",
      }
    )

    # good
    method(foo, bar, {
      baz: "a",
      qux: "b",
    })

    # good
    method(
      foo,
      bar,
      {
        baz: "a",
        qux: "b",
      }
    )
