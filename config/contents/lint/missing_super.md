This cop checks for the presence of constructors and lifecycle callbacks
without calls to `super`.

### Example:
    # bad
    class Employee < Person
      def initialize(name, salary)
        @salary = salary
      end
    end

    # good
    class Employee < Person
      def initialize(name, salary)
        super(name)
        @salary = salary
      end
    end

    # bad
    class Parent
      def self.inherited(base)
        do_something
      end
    end

    # good
    class Parent
      def self.inherited(base)
        super
        do_something
      end
    end
