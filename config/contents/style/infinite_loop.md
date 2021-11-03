Use `Kernel#loop` for infinite loops.

### Safety:

This cop is unsafe as the rule should not necessarily apply if the loop
body might raise a `StopIteration` exception; contrary to other infinite
loops, `Kernel#loop` silently rescues that and returns `nil`.

### Example:
    # bad
    while true
      work
    end

    # good
    loop do
      work
    end