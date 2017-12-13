This cop checks for the presence of superfluous parentheses around the
condition of if/unless/while/until.

### Example:
    # bad
    x += 1 while (x < 10)
    foo unless (bar || baz)

    if (x > 10)
    elsif (x < 3)
    end

    # good
    x += 1 while x < 10
    foo unless bar || baz

    if x > 10
    elsif x < 3
    end