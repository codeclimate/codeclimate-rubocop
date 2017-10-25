This cop checks that the closing brace in a method definition is either
on the same line as the last method parameter, or a new line.

When using the `symmetrical` (default) style:

If a method definition's opening brace is on the same line as the
first parameter of the definition, then the closing brace should be
on the same line as the last parameter of the definition.

If an method definition's opening brace is on the line above the first
parameter of the definition, then the closing brace should be on the
line below the last parameter of the definition.

When using the `new_line` style:

The closing brace of a multi-line method definition must be on the line
after the last parameter of the definition.

When using the `same_line` style:

The closing brace of a multi-line method definition must be on the same
line as the last parameter of the definition.

### Example:

      # symmetrical: bad
      # new_line: good
      # same_line: bad
      def foo(a,
        b
      )

      # symmetrical: bad
      # new_line: bad
      # same_line: good
      def foo(
        a,
        b)

      # symmetrical: good
      # new_line: bad
      # same_line: good
      def foo(a,
        b)

      # symmetrical: good
      # new_line: good
      # same_line: bad
      def foo(
        a,
        b
      )