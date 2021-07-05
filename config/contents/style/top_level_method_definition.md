Newcomers to ruby applications may write top-level methods,
when ideally they should be organized in appropriate classes or modules.
This cop looks for definitions of top-level methods and warns about them.

However for ruby scripts it is perfectly fine to use top-level methods.
Hence this cop is disabled by default.

### Example:
    # bad
    def some_method
    end

    # bad
    def self.some_method
    end

    # bad
    define_method(:foo) { puts 1 }

    # good
    module Foo
      def some_method
      end
    end

    # good
    class Foo
      def self.some_method
      end
    end

    # good
    Struct.new do
      def some_method
      end
    end

    # good
    class Foo
      define_method(:foo) { puts 1 }
    end