This cop ensures that eval methods (`eval`, `instance_eval`, `class_eval`
and `module_eval`) are given filename and line number values (`__FILE__`
and `__LINE__`). This data is used to ensure that any errors raised
within the evaluated code will be given the correct identification
in a backtrace.

The cop also checks that the line number given relative to `__LINE__` is
correct.

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