Checks for uses of `if-else` and ternary operators with a negated condition
which can be simplified by inverting condition and swapping branches.

### Example:
    # bad
    if !x
      do_something
    else
      do_something_else
    end

    # good
    if x
      do_something_else
    else
      do_something
    end

    # bad
    !x ? do_something : do_something_else

    # good
    x ? do_something_else : do_something
