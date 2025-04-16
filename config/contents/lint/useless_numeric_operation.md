Certain numeric operations have no impact, being:
Adding or subtracting 0, multiplying or dividing by 1 or raising to the power of 1.
These are probably leftover from debugging, or are mistakes.

### Example:

    # bad
    x + 0
    x - 0
    x * 1
    x / 1
    x ** 1

    # good
    x

    # bad
    x += 0
    x -= 0
    x *= 1
    x /= 1
    x **= 1

    # good
    x = x
