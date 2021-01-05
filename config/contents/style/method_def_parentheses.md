This cop checks for parentheses around the arguments in method
definitions. Both instance and class/singleton methods are checked.

This cop does not consider endless methods, since parentheses are
always required for them.

### Example: EnforcedStyle: require_parentheses (default)
    # The `require_parentheses` style requires method definitions
    # to always use parentheses

    # bad
    def bar num1, num2
      num1 + num2
    end

    def foo descriptive_var_name,
            another_descriptive_var_name,
            last_descriptive_var_name
      do_something
    end

    # good
    def bar(num1, num2)
      num1 + num2
    end

    def foo(descriptive_var_name,
            another_descriptive_var_name,
            last_descriptive_var_name)
      do_something
    end

### Example: EnforcedStyle: require_no_parentheses
    # The `require_no_parentheses` style requires method definitions
    # to never use parentheses

    # bad
    def bar(num1, num2)
      num1 + num2
    end

    def foo(descriptive_var_name,
            another_descriptive_var_name,
            last_descriptive_var_name)
      do_something
    end

    # good
    def bar num1, num2
      num1 + num2
    end

    def foo descriptive_var_name,
            another_descriptive_var_name,
            last_descriptive_var_name
      do_something
    end

### Example: EnforcedStyle: require_no_parentheses_except_multiline
    # The `require_no_parentheses_except_multiline` style prefers no
    # parentheses when method definition arguments fit on single line,
    # but prefers parentheses when arguments span multiple lines.

    # bad
    def bar(num1, num2)
      num1 + num2
    end

    def foo descriptive_var_name,
            another_descriptive_var_name,
            last_descriptive_var_name
      do_something
    end

    # good
    def bar num1, num2
      num1 + num2
    end

    def foo(descriptive_var_name,
            another_descriptive_var_name,
            last_descriptive_var_name)
      do_something
    end