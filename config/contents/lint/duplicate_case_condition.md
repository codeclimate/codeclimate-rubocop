Checks that there are no repeated conditions
used in case 'when' expressions.

### Example:

    # bad

    case x
    when 'first'
      do_something
    when 'first'
      do_something_else
    end

### Example:

    # good

    case x
    when 'first'
      do_something
    when 'second'
      do_something_else
    end