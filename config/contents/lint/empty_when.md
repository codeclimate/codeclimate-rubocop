This cop checks for the presence of `when` branches without a body.

### Example:

    # bad

    case foo
    when bar then 1
    when baz then # nothing
    end

### Example:

    # good

    case foo
    when bar then 1
    when baz then 2
    end