Checks for comma (,) preceded by space.

### Example:
    # bad
    [1 , 2 , 3]
    a(1 , 2)
    each { |a , b| }

    # good
    [1, 2, 3]
    a(1, 2)
    each { |a, b| }
