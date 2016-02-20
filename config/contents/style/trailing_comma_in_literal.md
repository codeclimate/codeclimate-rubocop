This cop checks for trailing comma in array and hash literals.

### Example:
    # always bad
    a = [1, 2,]

    # good if EnforcedStyleForMultiline is consistent_comma
    a = [
      1, 2,
      3,
    ]

    # good if EnforcedStyleForMultiline is comma or consistent_comma
    a = [
      1,
      2,
    ]

    # good if EnforcedStyleForMultiline is no_comma
    a = [
      1,
      2
    ]