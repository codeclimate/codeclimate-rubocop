Checks for uses of the class/module name instead of
self, when defining class/module methods.

### Example:
    # bad
    class SomeClass
      def SomeClass.class_method
        # ...
      end
    end

    # good
    class SomeClass
      def self.class_method
        # ...
      end
    end