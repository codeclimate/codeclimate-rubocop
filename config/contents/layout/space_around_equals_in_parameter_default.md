Checks that the equals signs in parameter default assignments
have or don't have surrounding space depending on configuration.

### Example: EnforcedStyle: space (default)
    # bad
    def some_method(arg1=:default, arg2=nil, arg3=[])
      # do something...
    end

    # good
    def some_method(arg1 = :default, arg2 = nil, arg3 = [])
      # do something...
    end

### Example: EnforcedStyle: no_space
    # bad
    def some_method(arg1 = :default, arg2 = nil, arg3 = [])
      # do something...
    end

    # good
    def some_method(arg1=:default, arg2=nil, arg3=[])
      # do something...
    end