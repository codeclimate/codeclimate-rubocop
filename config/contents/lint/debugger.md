This cop checks for calls to debugger or pry.
The cop can be configured to define which methods and receivers must be fixed.

### Example:

    # bad (ok during development)

    # using pry
    def some_method
      binding.pry
      do_something
    end

### Example:

    # bad (ok during development)

    # using byebug
    def some_method
      byebug
      do_something
    end

### Example:

    # good

    def some_method
      do_something
    end