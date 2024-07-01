Checks for missing top-level documentation of classes and
modules. Classes with no body are exempt from the check and so are
namespace modules - modules that have nothing in their bodies except
classes, other modules, constant definitions or constant visibility
declarations.

The documentation requirement is annulled if the class or module has
a `#:nodoc:` comment next to it. Likewise, `#:nodoc: all` does the
same for all its children.

### Example:
    # bad
    class Person
      # ...
    end

    module Math
    end

    # good
    # Description/Explanation of Person class
    class Person
      # ...
    end

    # allowed
    # Class without body
    class Person
    end

    # Namespace - A namespace can be a class or a module
    # Containing a class
    module Namespace
      # Description/Explanation of Person class
      class Person
        # ...
      end
    end

    # Containing constant visibility declaration
    module Namespace
      class Private
      end

      private_constant :Private
    end

    # Containing constant definition
    module Namespace
      Public = Class.new
    end

    # Macro calls
    module Namespace
      extend Foo
    end

### Example: AllowedConstants: ['ClassMethods']

     # good
     module A
       module ClassMethods
         # ...
       end
     end
