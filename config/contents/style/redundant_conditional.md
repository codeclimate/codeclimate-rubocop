Checks for redundant returning of true/false in conditionals.

### Example:
    # bad
    x == y ? true : false

    # bad
    if x == y
      true
    else
      false
    end

    # good
    x == y

    # bad
    x == y ? false : true

    # good
    x != y