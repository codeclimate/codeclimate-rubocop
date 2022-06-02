Checks for methods called on a do...end block. The point of
this check is that it's easy to miss the call tacked on to the block
when reading code.

### Example:
    # bad
    a do
      b
    end.c

    # good
    a { b }.c

    # good
    foo = a do
      b
    end
    foo.c