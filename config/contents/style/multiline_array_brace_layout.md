This cop checks that the closing brace in an array literal is
symmetrical with respect to the opening brace and the array
elements.

If an array's opening brace is on the same line as the first element
of the array, then the closing brace should be on the same line as
the last element of the array.

If an array's opening brace is on a separate line from the first
element of the array, then the closing brace should be on the line
after the last element of the array.

### Example:

      # bad
      [ :a,
        :b
      ]

      # bad
      [
        :a,
        :b ]

      # good
      [ :a,
        :b ]

      #good
      [
        :a,
        :b
      ]