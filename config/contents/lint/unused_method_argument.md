This cop checks for unused method arguments.

### Example:

    # bad

    def some_method(used, unused, _unused_but_allowed)
      puts used
    end

### Example:

    # good

    def some_method(used, _unused, _unused_but_allowed)
      puts used
    end