Checks for uses of while with a negated condition.

### Example:
    # bad
    while !foo
      bar
    end

    # good
    until foo
      bar
    end

    # bad
    bar until !foo

    # good
    bar while foo
    bar while !foo && baz