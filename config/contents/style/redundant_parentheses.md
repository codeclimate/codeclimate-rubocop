Checks for redundant parentheses.

### Example:

    # bad
    (x) if ((y.z).nil?)

    # good
    x if y.z.nil?
