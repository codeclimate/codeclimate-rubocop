Checks for empty else-clauses, possibly including comments and/or an
explicit `nil` depending on the EnforcedStyle.

### Example: EnforcedStyle: empty
    # warn only on empty else

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

    # good
    if condition
      statement
    else
      statement
    end

    # good
    if condition
      statement
    end

### Example: EnforcedStyle: nil
    # warn on else with nil in it

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

    # good
    if condition
      statement
    else
      statement
    end

    # good
    if condition
      statement
    end

### Example: EnforcedStyle: both (default)
    # warn on empty else and else with nil in it

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

    # good
    if condition
      statement
    else
      statement
    end

    # good
    if condition
      statement
    end