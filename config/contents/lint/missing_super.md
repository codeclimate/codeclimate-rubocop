Checks for the presence of constructors and lifecycle callbacks
without calls to `super`.

This cop does not consider `method_missing` (and `respond_to_missing?`)
because in some cases it makes sense to overtake what is considered a
missing method. In other cases, the theoretical ideal handling could be
challenging or verbose for no actual gain.

Autocorrection is not supported because the position of `super` cannot be
determined automatically.

`Object` and `BasicObject` are allowed by this cop because of their
stateless nature. However, sometimes you might want to allow other parent
classes from this cop, for example in the case of an abstract class that is
not meant to be called with `super`. In those cases, you can use the
`AllowedParentClasses` option to specify which classes should be allowed
*in addition to* `Object` and `BasicObject`.

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
    Employee = Class.new(Person) do
      def initialize(name, salary)
        @salary = salary
      end
    end

    # good
    Employee = Class.new(Person) do
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

    # good
    class ClassWithNoParent
      def initialize
        do_something
      end
    end

### Example: AllowedParentClasses: [MyAbstractClass]
    # good
    class MyConcreteClass < MyAbstractClass
      def initialize
        do_something
      end
    end
