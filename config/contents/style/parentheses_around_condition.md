Checks for the presence of superfluous parentheses around the
condition of if/unless/while/until.

`AllowSafeAssignment` option for safe assignment.
By safe assignment we mean putting parentheses around
an assignment to indicate "I know I'm using an assignment
as a condition. It's not a mistake."

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

### Example: AllowSafeAssignment: true (default)
    # good
    foo unless (bar = baz)

### Example: AllowSafeAssignment: false
    # bad
    foo unless (bar = baz)

### Example: AllowInMultilineConditions: false (default)
    # bad
    if (x > 10 &&
       y > 10)
    end

    # good
     if x > 10 &&
        y > 10
     end

### Example: AllowInMultilineConditions: true
    # good
    if (x > 10 &&
       y > 10)
    end
