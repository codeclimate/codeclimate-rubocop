Checks for useless method definitions, specifically: empty constructors
and methods just delegating to `super`.

### Safety:

This cop is unsafe as it can register false positives for cases when an empty
constructor just overrides the parent constructor, which is bad anyway.

### Example:
    # bad
    def initialize
      super
    end

    def method
      super
    end

    # good - with default arguments
    def initialize(x = Object.new)
      super
    end

    # good
    def initialize
      super
      initialize_internals
    end

    def method(*args)
      super(:extra_arg, *args)
    end
