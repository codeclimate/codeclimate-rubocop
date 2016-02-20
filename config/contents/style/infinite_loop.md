Use `Kernel#loop` for infinite loops.

### Example:
    # bad
    while true
      work
    end

    # good
    loop do
      work
    end