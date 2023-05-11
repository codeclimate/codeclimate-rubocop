Checks for a line break before the first element in a
multi-line hash.

### Example:

      # bad
      { a: 1,
        b: 2}

      # good
      {
        a: 1,
        b: 2 }

      # good
      {
        a: 1, b: {
        c: 3
      }}

### Example: AllowMultilineFinalElement: false (default)

      # bad
      { a: 1, b: {
        c: 3
      }}

### Example: AllowMultilineFinalElement: true

      # bad
      { a: 1,
        b: {
        c: 3
      }}

      # good
      { a: 1, b: {
        c: 3
      }}
