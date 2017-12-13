Checks for uses of semicolon in if statements.

### Example:

    # bad
    result = if some_condition; something else another_thing end

    # good
    result = some_condition ? something : another_thing
