Checks for interpolated literals.

NOTE: Array literals interpolated in regexps are not handled by this cop, but
by `Lint/ArrayLiteralInRegexp` instead.

### Example:

    # bad
    "result is #{10}"

    # good
    "result is 10"