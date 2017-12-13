This cop checks for trailing comma in array and hash literals.

### Example: EnforcedStyleForMultiline: consistent_comma
    # bad
    a = [1, 2,]

    # good
    a = [
      1, 2,
      3,
    ]

    # good
    a = [
      1,
      2,
    ]

### Example: EnforcedStyleForMultiline: comma
    # bad
    a = [1, 2,]

    # good
    a = [
      1,
      2,
    ]

### Example: EnforcedStyleForMultiline: no_comma (default)
    # bad
    a = [1, 2,]

    # good
    a = [
      1,
      2
    ]