Checks for assignments in the conditions of
if/while/until.

`AllowSafeAssignment` option for safe assignment.
By safe assignment we mean putting parentheses around
an assignment to indicate "I know I'm using an assignment
as a condition. It's not a mistake."

### Example:
    # bad
    if some_var = true
      do_something
    end

    # good
    if some_var == true
      do_something
    end

### Example: AllowSafeAssignment: true (default)
    # good
    if (some_var = true)
      do_something
    end

### Example: AllowSafeAssignment: false
    # bad
    if (some_var = true)
      do_something
    end
