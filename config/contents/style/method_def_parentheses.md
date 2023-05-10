Checks for parentheses around the arguments in method
definitions. Both instance and class/singleton methods are checked.

Regardless of style, parentheses are necessary for:

1. Endless methods
2. Argument lists containing a `forward-arg` (`...`)
3. Argument lists containing an anonymous rest arguments forwarding (`*`)
4. Argument lists containing an anonymous keyword rest arguments forwarding (`**`)
5. Argument lists containing an anonymous block forwarding (`&`)

Removing the parens would be a syntax error here.

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