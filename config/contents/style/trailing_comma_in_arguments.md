This cop checks for trailing comma in argument lists.

### Example: EnforcedStyleForMultiline: consistent_comma
    # bad
    method(1, 2,)

    # good
    method(
      1, 2,
      3,
    )

    # good
    method(
      1,
      2,
    )

### Example: EnforcedStyleForMultiline: comma
    # bad
    method(1, 2,)

    # good
    method(
      1,
      2,
    )

### Example: EnforcedStyleForMultiline: no_comma (default)
    # bad
    method(1, 2,)

    # good
    method(
      1,
      2
    )