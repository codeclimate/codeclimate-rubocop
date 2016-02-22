This cop checks that the closing brace in a method call is
symmetrical with respect to the opening brace and the method
arguments.

If a method call's opening brace is on the same line as the
first argument of the call, then the closing brace should be
on the same line as the last argument of the call.

If a method call's opening brace is on a separate line from
the first argument of the call, then the closing brace should
be on the line after the last argument of the call.

### Example:

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

      #good
      foo(
        a,
        b
      )