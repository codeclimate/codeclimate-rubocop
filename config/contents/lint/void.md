This cop checks for operators, variables and literals used
in void context.

### Example:

    # bad

    def some_method
      some_num * 10
      do_something
    end

### Example:

    # bad

    def some_method
      some_var
      do_something
    end

### Example:

    # good

    def some_method
      do_something
      some_num * 10
    end

### Example:

    # good

    def some_method
      do_something
      some_var
    end