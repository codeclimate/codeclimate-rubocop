This cop checks for nested method definitions.

### Example:

    # bad

    # `bar` definition actually produces methods in the same scope
    # as the outer `foo` method. Furthermore, the `bar` method
    # will be redefined every time `foo` is invoked.
    def foo
      def bar
      end
    end

### Example:

    # good

    def foo
      bar = -> { puts 'hello' }
      bar.call
    end

### Example:

    # good

    def foo
      self.class_eval do
        def bar
        end
      end
    end

    def foo
      self.module_exec do
        def bar
        end
      end
    end

### Example:

    # good

    def foo
      class << self
        def bar
        end
      end
    end