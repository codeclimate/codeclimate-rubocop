Checks for trailing code after the method definition.

NOTE: It always accepts endless method definitions that are basically on the same line.

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

    def endless_method = do_stuff
