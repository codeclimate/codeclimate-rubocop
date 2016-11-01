Checks for empty else-clauses, possibly including comments and/or an
explicit `nil` depending on the EnforcedStyle.

SupportedStyles:

### Example:
    # good for all styles

    if condition
      statement
    else
      statement
    end

    # good for all styles
    if condition
      statement
    end

### Example:
    # empty - warn only on empty else

    # bad
    if condition
      statement
    else
    end

    # good
    if condition
      statement
    else
      nil
    end

### Example:
    # nil - warn on else with nil in it

    # bad
    if condition
      statement
    else
      nil
    end

    # good
    if condition
      statement
    else
    end

### Example:
    # both - warn on empty else and else with nil in it

    # bad
    if condition
      statement
    else
      nil
    end

    # bad
    if condition
      statement
    else
    end