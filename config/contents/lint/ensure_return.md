This cop checks for *return* from an *ensure* block.

### Example:

    # bad

    begin
      do_something
    ensure
      do_something_else
      return
    end

### Example:

    # good

    begin
      do_something
    ensure
      do_something_else
    end