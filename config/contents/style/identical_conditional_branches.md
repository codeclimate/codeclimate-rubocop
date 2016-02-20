This cop checks for identical lines at the end of each branch of a
conditional statement.

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