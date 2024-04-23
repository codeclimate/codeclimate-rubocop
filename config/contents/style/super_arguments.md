Checks for redundant argument forwarding when calling super
with arguments identical to the method definition.

### Example:
    # bad
    def method(*args, **kwargs)
      super(*args, **kwargs)
    end

    # good - implicitly passing all arguments
    def method(*args, **kwargs)
      super
    end

    # good - forwarding a subset of the arguments
    def method(*args, **kwargs)
      super(*args)
    end

    # good - forwarding no arguments
    def method(*args, **kwargs)
      super()
    end

    # good - assigning to the block variable before calling super
    def method(&block)
      # Assigning to the block variable would pass the old value to super,
      # under this circumstance the block must be referenced explicitly.
      block ||= proc { 'fallback behavior' }
      super(&block)
    end