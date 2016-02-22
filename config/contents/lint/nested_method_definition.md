This cop checks for nested method definitions.

### Example:
    # `bar` definition actually produces methods in the same scope
    # as the outer `foo` method. Furthermore, the `bar` method
    # will be redefined every time `foo` is invoked.
    def foo
      def bar
      end
    end
