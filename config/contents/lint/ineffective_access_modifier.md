Checks for `private` or `protected` access modifiers which are
applied to a singleton method. These access modifiers do not make
singleton methods private/protected. `private_class_method` can be
used for that.

### Example:

    # bad

    class C
      private

      def self.method
        puts 'hi'
      end
    end

### Example:

    # good

    class C
      def self.method
        puts 'hi'
      end

      private_class_method :method
    end

### Example:

    # good

    class C
      class << self
        private

        def method
          puts 'hi'
        end
      end
    end