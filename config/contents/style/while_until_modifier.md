Checks for while and until statements that would fit on one line
if written as a modifier while/until. The maximum line length is
configured in the `Layout/LineLength` cop.

### Example:
    # bad
    while x < 10
      x += 1
    end

    # good
    x += 1 while x < 10

### Example:
    # bad
    until x > 10
      x += 1
    end

    # good
    x += 1 until x > 10

### Example:
    # bad
    x += 100 while x < 500 # a long comment that makes code too long if it were a single line

    # good
    while x < 500 # a long comment that makes code too long if it were a single line
      x += 100
    end