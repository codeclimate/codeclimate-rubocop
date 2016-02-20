Checks for uses of the `then` keyword in multi-line if statements.

### Example: This is considered bad practice:

    if cond then
    end

### Example: If statements can contain `then` on the same line:

    if cond then a
    elsif cond then b
    end