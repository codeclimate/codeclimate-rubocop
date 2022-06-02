Checks for parentheses in the definition of a method,
that does not take any arguments. Both instance and
class/singleton methods are checked.

### Example:

    # bad
    def foo()
      do_something
    end

    # good
    def foo
      do_something
    end

    # bad
    def foo() = do_something

    # good
    def foo = do_something

    # good (without parentheses it's a syntax error)
    def foo() do_something end

### Example:

    # bad
    def Baz.foo()
      do_something
    end

    # good
    def Baz.foo
      do_something
    end