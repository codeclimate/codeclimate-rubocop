Enforces using `def self.method_name` or `class << self` to define class methods.

### Example: EnforcedStyle: def_self (default)
    # bad
    class SomeClass
      class << self
        attr_accessor :class_accessor

        def class_method
          # ...
        end
      end
    end

    # good
    class SomeClass
      def self.class_method
        # ...
      end

      class << self
        attr_accessor :class_accessor
      end
    end

    # good - contains private method
    class SomeClass
      class << self
        attr_accessor :class_accessor

        private

        def private_class_method
          # ...
        end
      end
    end

### Example: EnforcedStyle: self_class
    # bad
    class SomeClass
      def self.class_method
        # ...
      end
    end

    # good
    class SomeClass
      class << self
        def class_method
          # ...
        end
      end
    end
