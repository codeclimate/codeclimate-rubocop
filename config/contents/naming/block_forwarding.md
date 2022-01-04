In Ruby 3.1, anonymous block forwarding has been added.

This cop identifies places where `do_something(&block)` can be replaced
by `do_something(&)`.

It also supports the opposite style by alternative `explicit` option.

### Example: EnforcedStyle: anonymous (default)

    # bad
    def foo(&block)
      bar(&block)
    end

    # good
    def foo(&)
      bar(&)
    end

### Example: EnforcedStyle: explicit

    # bad
    def foo(&)
      bar(&)
    end

    # good
    def foo(&block)
      bar(&block)
    end
