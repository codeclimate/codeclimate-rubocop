Ensures that eval methods (`eval`, `instance_eval`, `class_eval`
and `module_eval`) are given filename and line number values (`\_\_FILE\_\_`
and `\_\_LINE\_\_`). This data is used to ensure that any errors raised
within the evaluated code will be given the correct identification
in a backtrace.

The cop also checks that the line number given relative to `\_\_LINE\_\_` is
correct.

This cop will autocorrect incorrect or missing filename and line number
values. However, if `eval` is called without a binding argument, the cop
will not attempt to automatically add a binding, or add filename and
line values.

### Example:
    # bad
    eval <<-RUBY
      def do_something
      end
    RUBY

    # bad
    C.class_eval <<-RUBY
      def do_something
      end
    RUBY

    # good
    eval <<-RUBY, binding, __FILE__, __LINE__ + 1
      def do_something
      end
    RUBY

    # good
    C.class_eval <<-RUBY, __FILE__, __LINE__ + 1
      def do_something
      end
    RUBY

This cop works only when a string literal is given as a code string.
No offense is reported if a string variable is given as below:

### Example:
    # not checked
    code = <<-RUBY
      def do_something
      end
    RUBY
    eval code
