Checks the spacing inside and after block parameters pipes.

### Example:

    # bad
    {}.each { | x,  y |puts x }

    # good
    {}.each { |x, y| puts x }