Ensures that each argument in a multi-line method call
starts on a separate line.

NOTE: This cop does not move the first argument, if you want that to
be on a separate line, see `Layout/FirstMethodArgumentLineBreak`.

### Example:

    # bad
    foo(a, b,
      c
    )

    # bad
    foo(a, b, {
      foo: "bar",
    })

    # good
    foo(
      a,
      b,
      c
    )

    # good
    foo(a, b, c)

### Example: AllowMultilineFinalElement: false (default)

    # good
    foo(
      a,
      b,
      {
        foo: "bar",
      }
    )

### Example: AllowMultilineFinalElement: true

    # good
    foo(
      a,
      b,
      {
        foo: "bar",
      }
    )
