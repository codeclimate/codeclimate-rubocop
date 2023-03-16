Identifies places where `if-elsif` constructions
can be replaced with `case-when`.

### Safety:

This cop is unsafe. `case` statements use `===` for equality,
so if the original conditional used a different equality operator, the
behavior may be different.

### Example: MinBranchesCount: 3 (default)
    # bad
    if status == :active
      perform_action
    elsif status == :inactive || status == :hibernating
      check_timeout
    elsif status == :invalid
      report_invalid
    else
      final_action
    end

    # good
    case status
    when :active
      perform_action
    when :inactive, :hibernating
      check_timeout
    when :invalid
      report_invalid
    else
      final_action
    end

### Example: MinBranchesCount: 4
    # good
    if status == :active
      perform_action
    elsif status == :inactive || status == :hibernating
      check_timeout
    elsif status == :invalid
      report_invalid
    else
      final_action
    end
