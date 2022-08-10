Checks for the presence of `if`, `elsif` and `unless` branches without a body.

NOTE: empty `else` branches are handled by `Style/EmptyElse`.

### Safety:

Autocorrection for this cop is not safe. The conditions for empty branches that
the autocorrection removes may have side effects, or the logic in subsequent
branches may change due to the removal of a previous condition.

### Example:
    # bad
    if condition
    end

    # bad
    unless condition
    end

    # bad
    if condition
      do_something
    elsif other_condition
    end

    # good
    if condition
      do_something
    end

    # good
    unless condition
      do_something
    end

    # good
    if condition
      do_something
    elsif other_condition
      do_something_else
    end

### Example: AllowComments: true (default)
    # good
    if condition
      do_something
    elsif other_condition
      # noop
    end

### Example: AllowComments: false
    # bad
    if condition
      do_something
    elsif other_condition
      # noop
    end
