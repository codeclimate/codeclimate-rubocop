Checks that the closing brace in a method call is either
on the same line as the last method argument, or a new line.

When using the `symmetrical` (default) style:

If a method call's opening brace is on the same line as the first
argument of the call, then the closing brace should be on the same
line as the last argument of the call.

If an method call's opening brace is on the line above the first
argument of the call, then the closing brace should be on the line
below the last argument of the call.

When using the `new_line` style:

The closing brace of a multi-line method call must be on the line
after the last argument of the call.

When using the `same_line` style:

The closing brace of a multi-line method call must be on the same
line as the last argument of the call.

### Example: EnforcedStyle: symmetrical (default)
    # bad
    foo(a,
      b
    )

    # bad
    foo(
      a,
      b)

    # good
    foo(a,
      b)

    # good
    foo(
      a,
      b
    )

### Example: EnforcedStyle: new_line
    # bad
    foo(
      a,
      b)

    # bad
    foo(a,
      b)

    # good
    foo(a,
      b
    )

    # good
    foo(
      a,
      b
    )

### Example: EnforcedStyle: same_line
    # bad
    foo(a,
      b
    )

    # bad
    foo(
      a,
      b
    )

    # good
    foo(
      a,
      b)

    # good
    foo(a,
      b)