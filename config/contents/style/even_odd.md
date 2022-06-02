Checks for places where `Integer#even?` or `Integer#odd?`
can be used.

### Example:

    # bad
    if x % 2 == 0
    end

    # good
    if x.even?
    end