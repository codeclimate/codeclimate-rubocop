This cop checks that `include`, `extend` and `prepend` exists at
the top level.
Using these at the top level affects the behavior of `Object`.
There will not be using `include`, `extend` and `prepend` at
the top level. Let's use it inside `class` or `module`.

### Example:
    # bad
    include M

    class C
    end

    # bad
    extend M

    class C
    end

    # bad
    prepend M

    class C
    end

    # good
    class C
      include M
    end

    # good
    class C
      extend M
    end

    # good
    class C
      prepend M
    end