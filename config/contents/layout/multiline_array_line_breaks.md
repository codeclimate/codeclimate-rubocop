Ensures that each item in a multi-line array
starts on a separate line.

### Example: AllowMultilineFinalElement: false (default)

    # bad
    [
      a, b,
      c
    ]

    # bad
    [ a, b, foo(
      bar
    )]

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

### Example: AllowMultilineFinalElement: true

    # bad
    [
      a, b,
      c
    ]

    # good
    [ a, b, foo(
      bar
    )]

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