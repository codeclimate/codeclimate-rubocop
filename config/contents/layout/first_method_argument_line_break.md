Checks for a line break before the first argument in a
multi-line method call.

### Example:

      # bad
      method(foo, bar,
        baz)

      # good
      method(
        foo, bar,
        baz)

      # ignored
      method foo, bar,
        baz