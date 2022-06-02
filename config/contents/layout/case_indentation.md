Checks how the `when` and ``in``s of a `case` expression
are indented in relation to its `case` or `end` keyword.

It will register a separate offense for each misaligned `when` and `in`.

### Example:
    # If Layout/EndAlignment is set to keyword style (default)
    # *case* and *end* should always be aligned to same depth,
    # and therefore *when* should always be aligned to both -
    # regardless of configuration.

    # bad for all styles
    case n
      when 0
        x * 2
      else
        y / 3
    end

    case n
      in pattern
        x * 2
      else
        y / 3
    end

    # good for all styles
    case n
    when 0
      x * 2
    else
      y / 3
    end

    case n
    in pattern
      x * 2
    else
      y / 3
    end

### Example: EnforcedStyle: case (default)
    # if EndAlignment is set to other style such as
    # start_of_line (as shown below), then *when* alignment
    # configuration does have an effect.

    # bad
    a = case n
    when 0
      x * 2
    else
      y / 3
    end

    a = case n
    in pattern
      x * 2
    else
      y / 3
    end

    # good
    a = case n
        when 0
          x * 2
        else
          y / 3
    end

    a = case n
        in pattern
          x * 2
        else
          y / 3
    end

### Example: EnforcedStyle: end
    # bad
    a = case n
        when 0
          x * 2
        else
          y / 3
    end

    a = case n
        in pattern
          x * 2
        else
          y / 3
    end

    # good
    a = case n
    when 0
      x * 2
    else
      y / 3
    end

    a = case n
    in pattern
      x * 2
    else
      y / 3
    end