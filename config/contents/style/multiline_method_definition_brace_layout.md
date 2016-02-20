This cop checks that the closing brace in a method definition is
symmetrical with respect to the opening brace and the method
parameters.

If a method definition's opening brace is on the same line as the
first parameter of the definition, then the closing brace should be
on the same line as the last parameter of the definition.

If a method definition's opening brace is on a separate line from
the first parameter of the definition, then the closing brace should
be on the line after the last parameter of the definition.

### Example:

      # bad
      def foo(a,
        b
        )
      end

      # bad
      def foo(
        a,
        b)
      end

      # good
      def foo(a,
        b)
      end

      #good
      def foo(
        a,
        b
      )
      end