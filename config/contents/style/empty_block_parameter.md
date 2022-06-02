Checks for pipes for empty block parameters. Pipes for empty
block parameters do not cause syntax errors, but they are redundant.

### Example:
    # bad
    a do ||
      do_something
    end

    # bad
    a { || do_something }

    # good
    a do
    end

    # good
    a { do_something }