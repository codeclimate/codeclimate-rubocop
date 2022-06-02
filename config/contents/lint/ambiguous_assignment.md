Checks for mistyped shorthand assignments.

### Example:
    # bad
    x =- y
    x =+ y
    x =* y
    x =! y

    # good
    x -= y # or x = -y
    x += y # or x = +y
    x *= y # or x = *y
    x != y # or x = !y
