Checks for class methods that are defined using the `::`
operator instead of the `.` operator.

### Example:
    # bad
    class Foo
      def self::bar
      end
    end

    # good
    class Foo
      def self.bar
      end
    end
