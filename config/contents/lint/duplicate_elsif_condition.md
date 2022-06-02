Checks that there are no repeated conditions used in if 'elsif'.

### Example:
    # bad
    if x == 1
      do_something
    elsif x == 1
      do_something_else
    end

    # good
    if x == 1
      do_something
    elsif x == 2
      do_something_else
    end
