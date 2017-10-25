This cop checks that the closing brace in a hash literal is either
on the same line as the last hash element, or a new line.

When using the `symmetrical` (default) style:

If a hash's opening brace is on the same line as the first element
of the hash, then the closing brace should be on the same line as
the last element of the hash.

If a hash's opening brace is on the line above the first element
of the hash, then the closing brace should be on the line below
the last element of the hash.

When using the `new_line` style:

The closing brace of a multi-line hash literal must be on the line
after the last element of the hash.

When using the `same_line` style:

The closing brace of a multi-line hash literal must be on the same
line as the last element of the hash.

### Example:

      # symmetrical: bad
      # new_line: good
      # same_line: bad
      { a: 1,
        b: 2
      }

      # symmetrical: bad
      # new_line: bad
      # same_line: good
      {
        a: 1,
        b: 2 }

      # symmetrical: good
      # new_line: bad
      # same_line: good
      { a: 1,
        b: 2 }

      # symmetrical: good
      # new_line: good
      # same_line: bad
      {
        a: 1,
        b: 2
      }