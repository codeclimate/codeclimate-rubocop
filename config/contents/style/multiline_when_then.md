Checks uses of the `then` keyword
in multi-line when statements.

### Example:
    # bad
    case foo
    when bar then
    end

    # good
    case foo
    when bar
    end

    # good
    case foo
    when bar then do_something
    end

    # good
    case foo
    when bar then do_something(arg1,
                               arg2)
    end
