Checks for classes and metaclasses without a body.
Such empty classes and metaclasses are typically an oversight or we should provide a comment
to be clearer what we're aiming for.

### Example:
    # bad
    class Foo
    end

    class Bar
      class << self
      end
    end

    class << obj
    end

    # good
    class Foo
      def do_something
        # ... code
      end
    end

    class Bar
      class << self
        attr_reader :bar
      end
    end

    class << obj
      attr_reader :bar
    end

### Example: AllowComments: false (default)
    # bad
    class Foo
      # TODO: implement later
    end

    class Bar
      class << self
        # TODO: implement later
      end
    end

    class << obj
      # TODO: implement later
    end

### Example: AllowComments: true
    # good
    class Foo
      # TODO: implement later
    end

    class Bar
      class << self
        # TODO: implement later
      end
    end

    class << obj
      # TODO: implement later
    end
