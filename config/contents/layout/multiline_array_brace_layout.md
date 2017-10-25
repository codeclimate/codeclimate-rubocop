This cop checks that the closing brace in an array literal is either
on the same line as the last array element, or a new line.

When using the `symmetrical` (default) style:

If an array's opening brace is on the same line as the first element
of the array, then the closing brace should be on the same line as
the last element of the array.

If an array's opening brace is on the line above the first element
of the array, then the closing brace should be on the line below
the last element of the array.

When using the `new_line` style:

The closing brace of a multi-line array literal must be on the line
after the last element of the array.

When using the `same_line` style:

The closing brace of a multi-line array literal must be on the same
line as the last element of the array.

### Example:

      # symmetrical: bad
      # new_line: good
      # same_line: bad
      [ :a,
        :b
      ]

      # symmetrical: bad
      # new_line: bad
      # same_line: good
      [
        :a,
        :b ]

      # symmetrical: good
      # new_line: bad
      # same_line: good
      [ :a,
        :b ]

      # symmetrical: good
      # new_line: good
      # same_line: bad
      [
        :a,
        :b
      ]