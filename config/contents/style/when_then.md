Checks for `when;` uses in `case` expressions.

### Example:
    # bad
    case foo
    when 1; 'baz'
    when 2; 'bar'
    end

    # good
    case foo
    when 1 then 'baz'
    when 2 then 'bar'
    end