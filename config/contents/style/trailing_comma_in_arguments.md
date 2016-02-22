This cop checks for trailing comma in argument lists.

### Example:
    # always bad
    method(1, 2,)

    # good if EnforcedStyleForMultiline is consistent_comma
    method(
      1, 2,
      3,
    )

    # good if EnforcedStyleForMultiline is comma or consistent_comma
    method(
      1,
      2,
    )

    # good if EnforcedStyleForMultiline is no_comma
    method(
      1,
      2
    )