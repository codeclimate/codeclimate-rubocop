Checks for trailing code after the class definition.

### Example:
    # bad
    class Foo; def foo; end
    end

    # good
    class Foo
      def foo; end
    end
