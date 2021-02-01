This cop checks for unintended or-assignment to a constant.

Constants should always be assigned in the same location. And its value
should always be the same. If constants are assigned in multiple
locations, the result may vary depending on the order of `require`.

Also, if you already have such an implementation, auto-correction may
change the result.

### Example:

    # bad
    CONST ||= 1

    # good
    CONST = 1
