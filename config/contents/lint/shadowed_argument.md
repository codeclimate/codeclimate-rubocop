This cop checks for shadowed arguments.

### Example:

    # bad

    do_something do |foo|
      foo = 42
      puts foo
    end

    def do_something(foo)
      foo = 42
      puts foo
    end

### Example:

    # good

    do_something do |foo|
      foo = foo + 42
      puts foo
    end

    def do_something(foo)
      foo = foo + 42
      puts foo
    end

    def do_something(foo)
      puts foo
    end