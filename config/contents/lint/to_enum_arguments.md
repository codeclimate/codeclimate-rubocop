Ensures that `to_enum`/`enum_for`, called for the current method,
has correct arguments.

### Example:
    # bad
    def foo(x, y = 1)
      return to_enum(__callee__, x) # `y` is missing
    end

    # good
    def foo(x, y = 1)
      # Alternatives to `__callee__` are `__method__` and `:foo`.
      return to_enum(__callee__, x, y)
    end

    # good
    def foo(x, y = 1)
      # It is also allowed if it is wrapped in some method like Sorbet.
      return to_enum(T.must(__callee__), x, y)
    end
