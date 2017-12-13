This cop enforces consistency between 'return nil' and 'return'.

Supported styles are: return, return_nil.

### Example: EnforcedStyle: return (default)
    # bad
    def foo(arg)
      return nil if arg
    end

    # good
    def foo(arg)
      return if arg
    end

### Example: EnforcedStyle: return_nil
    # bad
    def foo(arg)
      return if arg
    end

    # good
    def foo(arg)
      return nil if arg
    end