This cop checks for missing documentation comment for public methods.
It can optionally be configured to also require documentation for
non-public methods.

### Example:

    # bad

    class Foo
      def bar
        puts baz
      end
    end

    module Foo
      def bar
        puts baz
      end
    end

    def foo.bar
      puts baz
    end

    # good

    class Foo
      # Documentation
      def bar
        puts baz
      end
    end

    module Foo
      # Documentation
      def bar
        puts baz
      end
    end

    # Documentation
    def foo.bar
      puts baz
    end

### Example: RequireForNonPublicMethods: false (default)
    # good
    class Foo
      protected
      def do_something
      end
    end

    class Foo
      private
      def do_something
      end
    end

### Example: RequireForNonPublicMethods: true
    # bad
    class Foo
      protected
      def do_something
      end
    end

    class Foo
      private
      def do_something
      end
    end

    # good
    class Foo
      protected
      # Documentation
      def do_something
      end
    end

    class Foo
      private
      # Documentation
      def do_something
      end
    end
