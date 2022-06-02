Checks for trailing comma in argument lists.
The supported styles are:

* `consistent_comma`: Requires a comma after the last argument,
for all parenthesized method calls with arguments.
* `comma`: Requires a comma after the last argument, but only for
parenthesized method calls where each argument is on its own line.
* `no_comma`: Requires that there is no comma after the last
argument.

### Example: EnforcedStyleForMultiline: consistent_comma
    # bad
    method(1, 2,)

    # good
    method(1, 2)

    # good
    method(
      1, 2,
      3,
    )

    # good
    method(
      1, 2, 3,
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
    method(1, 2)

    # bad
    method(
      1, 2,
      3,
    )

    # good
    method(
      1, 2,
      3
    )

    # bad
    method(
      1, 2, 3,
    )

    # good
    method(
      1, 2, 3
    )

    # good
    method(
      1,
      2,
    )

### Example: EnforcedStyleForMultiline: no_comma (default)
    # bad
    method(1, 2,)

    # good
    method(1, 2)

    # good
    method(
      1,
      2
    )