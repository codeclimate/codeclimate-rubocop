This lint sees if there is a mismatch between the number of
expected fields for format/sprintf/#% and what is actually
passed as arguments.

In addition it checks whether different formats are used in the same
format string. Do not mix numbered, unnumbered, and named formats in
the same format string.

### Example:

    # bad

    format('A value: %s and another: %i', a_value)

### Example:

    # good

    format('A value: %s and another: %i', a_value, another)

### Example:

    # bad

    format('Unnumbered format: %s and numbered: %2$s', a_value, another)

### Example:

    # good

    format('Numbered format: %1$s and numbered %2$s', a_value, another)