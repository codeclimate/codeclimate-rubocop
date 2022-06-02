Checks for shadowed arguments.

This cop has `IgnoreImplicitReferences` configuration option.
It means argument shadowing is used in order to pass parameters
to zero arity `super` when `IgnoreImplicitReferences` is `true`.

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

### Example: IgnoreImplicitReferences: false (default)

    # bad
    def do_something(foo)
      foo = 42
      super
    end

    def do_something(foo)
      foo = super
      bar
    end

### Example: IgnoreImplicitReferences: true

    # good
    def do_something(foo)
      foo = 42
      super
    end

    def do_something(foo)
      foo = super
      bar
    end
