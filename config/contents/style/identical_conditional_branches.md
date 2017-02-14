This cop checks for identical lines at the beginning or end of
each branch of a conditional statement.

### Example:
    # bad
    if condition
      do_x
      do_z
    else
      do_y
      do_z
    end

    # good
    if condition
      do_x
    else
      do_y
    end
    do_z

    # bad
    if condition
      do_z
      do_x
    else
      do_z
      do_y
    end

    # good
    do_z
    if condition
      do_x
    else
      do_y
    end