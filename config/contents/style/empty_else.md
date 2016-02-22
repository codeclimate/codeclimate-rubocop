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

empty - warn only on empty else
    ### Example:
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

nil - warn on else with nil in it
    ### Example:
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

both - warn on empty else and else with nil in it
    ### Example:
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