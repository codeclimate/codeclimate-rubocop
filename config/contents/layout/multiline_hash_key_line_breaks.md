Ensures that each key in a multi-line hash
starts on a separate line.

### Example:

    # bad
    {
      a: 1, b: 2,
      c: 3
    }

    # good
    {
      a: 1,
      b: 2,
      c: 3
    }

    # good
    {
      a: 1,
      b: {
        c: 3,
      }
    }

### Example: AllowMultilineFinalElement: false (default)

    # bad
    { a: 1, b: {
      c: 3,
    }}

### Example: AllowMultilineFinalElement: true

    # good
    { a: 1, b: {
      c: 3,
    }}
