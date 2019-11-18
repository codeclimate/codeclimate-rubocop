This cop checks for unused method arguments.

### Example:
    # bad
    def some_method(used, unused, _unused_but_allowed)
      puts used
    end

    # good
    def some_method(used, _unused, _unused_but_allowed)
      puts used
    end

### Example: AllowUnusedKeywordArguments: false (default)
    # bad
    def do_something(used, unused: 42)
      used
    end

### Example: AllowUnusedKeywordArguments: true
    # good
    def do_something(used, unused: 42)
      used
    end

### Example: IgnoreEmptyMethods: true (default)
    # good
    def do_something(unused)
    end

### Example: IgnoreEmptyMethods: false
    # bad
    def do_something(unused)
    end
