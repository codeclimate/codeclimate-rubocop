Checks that `include`, `extend` and `prepend` statements appear
inside classes and modules, not at the top level, so as to not affect
the behavior of `Object`.

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