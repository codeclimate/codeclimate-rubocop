This cop checks for places where keyword arguments can be used instead of
boolean arguments when defining methods.

### Example:
    # bad
    def some_method(bar = false)
      puts bar
    end

    # bad - common hack before keyword args were introduced
    def some_method(options = {})
      bar = options.fetch(:bar, false)
      puts bar
    end

    # good
    def some_method(bar: false)
      puts bar
    end
