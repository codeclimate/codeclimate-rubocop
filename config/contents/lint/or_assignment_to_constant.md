This cop checks for unintended or-assignment to a constant.

Constants should always be assigned in the same location. And its value
should always be the same. If constants are assigned in multiple
locations, the result may vary depending on the order of `require`.

### Safety:

This cop is unsafe because code that is already conditionally
assigning a constant may have its behaviour changed by
auto-correction.

### Example:

    # bad
    CONST ||= 1

    # good
    CONST = 1
