This cop checks for the presence of `method_missing` without also
defining `respond_to_missing?` and falling back on `super`.

### Example:
    #bad
    def method_missing(name, *args)
      # ...
    end

    #good
    def respond_to_missing?(name, include_private)
      # ...
    end

    def method_missing(name, *args)
      # ...
      super
    end