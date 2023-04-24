Checks for a line break before the first parameter in a
multi-line method parameter definition.

### Example:

    # bad
    def method(foo, bar,
        baz)
      do_something
    end

    # good
    def method(
        foo, bar,
        baz)
      do_something
    end

    # ignored
    def method foo,
        bar
      do_something
    end

### Example: AllowMultilineFinalElement: false (default)

    # bad
    def method(foo, bar, baz = {
      :a => "b",
    })
      do_something
    end

    # good
    def method(
      foo, bar, baz = {
      :a => "b",
    })
      do_something
    end

### Example: AllowMultilineFinalElement: true

    # good
    def method(foo, bar, baz = {
      :a => "b",
    })
      do_something
    end
