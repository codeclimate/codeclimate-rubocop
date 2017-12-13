This cop checks for trailing code after the method definition.

### Example:
    # bad
    def some_method; do_stuff
    end

    def f(x); b = foo
      b[c: x]
    end

    # good
    def some_method
      do_stuff
    end

    def f(x)
      b = foo
      b[c: x]
    end
