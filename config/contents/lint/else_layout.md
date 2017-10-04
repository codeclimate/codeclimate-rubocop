This cop checks for odd else block layout - like
having an expression on the same line as the else keyword,
which is usually a mistake.

### Example:

    # bad

    if something
      ...
    else do_this
      do_that
    end

### Example:

    # good

    if something
      ...
    else
      do_this
      do_that
    end