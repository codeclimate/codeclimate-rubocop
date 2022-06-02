Checks for trailing commas in attribute declarations, such as
`#attr_reader`. Leaving a trailing comma will nullify the next method
definition by overriding it with a getter method.

### Example:

    # bad
    class Foo
      attr_reader :foo,

      def bar
        puts "Unreachable."
      end
    end

    # good
    class Foo
      attr_reader :foo

      def bar
        puts "No problem!"
      end
    end
