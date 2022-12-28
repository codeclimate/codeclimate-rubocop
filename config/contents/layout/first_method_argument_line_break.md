Checks for a line break before the first argument in a
multi-line method call.

### Example: AllowMultilineFinalElement: false (default)

      # bad
      method(foo, bar,
        baz)

      # bad
      method(foo, bar, {
        baz: "a",
        qux: "b",
      })

      # good
      method(
        foo, bar,
        baz)

      # good
      method(
        foo, bar, {
        baz: "a",
        qux: "b",
      })

      # ignored
      method foo, bar,
        baz

### Example: AllowMultilineFinalElement: true

      # bad
      method(foo, bar,
        baz)

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
        foo, bar,
        baz)

      # good
      method(
        foo,
        bar,
        {
          baz: "a",
          qux: "b",
        }
      )

      # ignored
      method foo, bar,
        baz