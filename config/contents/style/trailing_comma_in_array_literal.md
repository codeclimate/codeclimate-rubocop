Checks for trailing comma in array literals.
The configuration options are:

* `consistent_comma`: Requires a comma after the
last item of all non-empty, multiline array literals.
* `comma`: Requires a comma after last item in an array,
but only when each item is on its own line.
* `no_comma`: Does not require a comma after the
last item in an array

### Example: EnforcedStyleForMultiline: consistent_comma
    # bad
    a = [1, 2,]

    # good
    a = [1, 2]

    # good
    a = [
      1, 2,
      3,
    ]

    # good
    a = [
      1, 2, 3,
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
    a = [1, 2]

    # bad
    a = [
      1, 2,
      3,
    ]

    # good
    a = [
      1, 2,
      3
    ]

    # bad
    a = [
      1, 2, 3,
    ]

    # good
    a = [
      1, 2, 3
    ]

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