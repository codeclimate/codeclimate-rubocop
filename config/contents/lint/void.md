This cop checks for operators, variables, literals, and nonmutating
methods used in void context.

### Example:

    # bad

    def some_method
      some_num * 10
      do_something
    end

### Example:

    # bad

    def some_method(some_var)
      some_var
      do_something
    end

### Example:

    # bad, when CheckForMethodsWithNoSideEffects is set true

    def some_method(some_array)
      some_array.sort
      do_something(some_array)
    end

### Example:

    # good

    def some_method
      do_something
      some_num * 10
    end

### Example:

    # good

    def some_method(some_var)
      do_something
      some_var
    end

### Example:

    # good, when CheckForMethodsWithNoSideEffects is set true

    def some_method(some_array)
      some_array.sort!
      do_something(some_array)
    end