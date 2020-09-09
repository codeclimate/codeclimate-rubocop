If the branch of a conditional consists solely of a conditional node,
its conditions can be combined with the conditions of the outer branch.
This helps to keep the nesting level from getting too deep.

### Example:
    # bad
    if condition_a
      if condition_b
        do_something
      end
    end

    # good
    if condition_a && condition_b
      do_something
    end

### Example: AllowModifier: false (default)
    # bad
    if condition_a
      do_something if condition_b
    end

### Example: AllowModifier: true
    # good
    if condition_a
      do_something if condition_b
    end
