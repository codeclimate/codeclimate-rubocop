Ensures that each parameter in a multi-line method definition
starts on a separate line.

NOTE: This cop does not move the first argument, if you want that to
be on a separate line, see `Layout/FirstMethodParameterLineBreak`.

### Example:

    # bad
    def foo(a, b,
      c
    )
    end

    # good
    def foo(
      a,
      b,
      c
    )
    end

    # good
    def foo(
      a,
      b = {
        foo: "bar",
      }
    )
    end

    # good
    def foo(a, b, c)
    end

### Example: AllowMultilineFinalElement: false (default)

    # bad
    def foo(a, b = {
      foo: "bar",
    })
    end

### Example: AllowMultilineFinalElement: true

    # good
    def foo(a, b = {
      foo: "bar",
    })
    end
