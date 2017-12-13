This cop checks for parentheses in the definition of a method,
that does not take any arguments. Both instance and
class/singleton methods are checked.

### Example:

    # bad
    def foo()
      # does a thing
    end

    # good
    def foo
      # does a thing
    end

    # also good
    def foo() does_a_thing end

### Example:

    # bad
    def Baz.foo()
      # does a thing
    end

    # good
    def Baz.foo
      # does a thing
    end