Checks for `in;` uses in `case` expressions.

### Example:
    # bad
    case expression
    in pattern_a; foo
    in pattern_b; bar
    end

    # good
    case expression
    in pattern_a then foo
    in pattern_b then bar
    end
