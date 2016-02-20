This cop checks for methods called on a do...end block. The point of
this check is that it's easy to miss the call tacked on to the block
when reading code.

### Example:

    a do
      b
    end.c