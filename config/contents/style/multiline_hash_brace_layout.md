This cop checks that the closing brace in an a hash literal is
symmetrical with respect to the opening brace and the hash
elements.

If a hash's opening brace is on the same line as the first element
of the hash, then the closing brace should be on the same line as
the last element of the hash.

If a hash's opening brace is on a separate line from the first
element of the hash, then the closing brace should be on the line
after the last element of the hash.

### Example:

      # bad
      { a: 'a',
        b: 'b'
      }

      # bad
      {
        a: 'a',
        b: 'b' }

      # good
      { a: 'a',
        b: 'b' }

      #good
      {
        a: 'a',
        b: 'b'
      }