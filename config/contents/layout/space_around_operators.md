Checks that operators have space around them, except for **
which should not have surrounding space.

### Example:
    # bad
    total = 3*4
    "apple"+"juice"
    my_number = 38/4
    a ** b

    # good
    total = 3 * 4
    "apple" + "juice"
    my_number = 38 / 4
    a**b