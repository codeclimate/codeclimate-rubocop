This lint sees if there is a mismatch between the number of
expected fields for format/sprintf/#% and what is actually
passed as arguments.

### Example:

    format('A value: %s and another: %i', a_value)
