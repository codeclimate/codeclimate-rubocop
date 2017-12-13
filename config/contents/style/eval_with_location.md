This cop checks `eval` method usage. `eval` can receive source location
metadata, that are filename and line number. The metadata is used by
backtraces. This cop recommends to pass the metadata to `eval` method.

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