Checks uses of the `then` keyword in multi-line `in` statement.

### Example:
    # bad
    case expression
    in pattern then
    end

    # good
    case expression
    in pattern
    end

    # good
    case expression
    in pattern then do_something
    end

    # good
    case expression
    in pattern then do_something(arg1,
                                 arg2)
    end
