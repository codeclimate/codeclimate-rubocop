Ensures that each item in a multi-line array
starts on a separate line.

### Example:

    # bad
    [
      a, b,
      c
    ]

    # good
    [
      a,
      b,
      c
    ]

    # good
    [
      a,
      b,
      foo(
        bar
      )
    ]

### Example: AllowMultilineFinalElement: false (default)

    # bad
    [a, b, foo(
      bar
    )]

### Example: AllowMultilineFinalElement: true

    # good
    [a, b, foo(
      bar
    )]
