This cop checks for underscore-prefixed variables that are actually
used.

### Example:

    # bad

    [1, 2, 3].each do |_num|
      do_something(_num)
    end

### Example:

    # good

    [1, 2, 3].each do |num|
      do_something(num)
    end

### Example:

    # good

    [1, 2, 3].each do |_num|
      do_something # not using `_num`
    end