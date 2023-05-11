Check for redundant line continuation.

This cop marks a line continuation as redundant if removing the backslash
does not result in a syntax error.
However, a backslash at the end of a comment or
for string concatenation is not redundant and is not considered an offense.

### Example:
    # bad
    foo. \
      bar
    foo \
      &.bar \
        .baz

    # good
    foo.
      bar
    foo
      &.bar
        .baz

    # bad
    [foo, \
      bar]
    {foo: \
      bar}

    # good
    [foo,
      bar]
    {foo:
      bar}

    # bad
    foo(bar, \
      baz)

    # good
    foo(bar,
      baz)

    # also good - backslash in string concatenation is not redundant
    foo('bar' \
      'baz')

    # also good - backslash at the end of a comment is not redundant
    foo(bar, # \
      baz)

    # also good - backslash at the line following the newline begins with a + or -,
    # it is not redundant
    1 \
      + 2 \
        - 3

    # also good - backslash with newline between the method name and its arguments,
    # it is not redundant.
    some_method \
      (argument)
