Looks for `unless` expressions with `else` clauses.

### Example:
    # bad
    unless foo_bar.nil?
      # do something...
    else
      # do a different thing...
    end

    # good
    if foo_bar.present?
      # do something...
    else
      # do a different thing...
    end