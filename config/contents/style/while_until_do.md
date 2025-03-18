Checks for uses of `do` in multi-line `while/until` statements.

### Example:

    # bad
    while x.any? do
      do_something(x.pop)
    end

    # good
    while x.any?
      do_something(x.pop)
    end

    # bad
    until x.empty? do
      do_something(x.pop)
    end

    # good
    until x.empty?
      do_something(x.pop)
    end