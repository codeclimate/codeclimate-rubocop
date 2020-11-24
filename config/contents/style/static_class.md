This cop checks for places where classes with only class methods can be
replaced with a module. Classes should be used only when it makes sense to create
instances out of them.

This cop is marked as unsafe, because it is possible that this class is a parent
for some other subclass, monkey-patched with instance methods or
a dummy instance is instantiated from it somewhere.

### Example:
    # bad
    class SomeClass
      def self.some_method
        # body omitted
      end

      def self.some_other_method
        # body omitted
      end
    end

    # good
    module SomeModule
      module_function

      def some_method
        # body omitted
      end

      def some_other_method
        # body omitted
      end
    end

    # good - has instance method
    class SomeClass
      def instance_method; end
      def self.class_method; end
    end
