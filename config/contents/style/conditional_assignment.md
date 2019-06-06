Check for `if` and `case` statements where each branch is used for
assignment to the same variable when using the return of the
condition can be used instead.

### Example: EnforcedStyle: assign_to_condition (default)
    # bad
    if foo
      bar = 1
    else
      bar = 2
    end

    case foo
    when 'a'
      bar += 1
    else
      bar += 2
    end

    if foo
      some_method
      bar = 1
    else
      some_other_method
      bar = 2
    end

    # good
    bar = if foo
            1
          else
            2
          end

    bar += case foo
           when 'a'
             1
           else
             2
           end

    bar << if foo
             some_method
             1
           else
             some_other_method
             2
           end

### Example: EnforcedStyle: assign_inside_condition
    # bad
    bar = if foo
            1
          else
            2
          end

    bar += case foo
           when 'a'
             1
           else
             2
           end

    bar << if foo
             some_method
             1
           else
             some_other_method
             2
           end

    # good
    if foo
      bar = 1
    else
      bar = 2
    end

    case foo
    when 'a'
      bar += 1
    else
      bar += 2
    end

    if foo
      some_method
      bar = 1
    else
      some_other_method
      bar = 2
    end
