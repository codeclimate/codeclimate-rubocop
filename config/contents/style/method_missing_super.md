This cop checks for the presence of `method_missing` without
falling back on `super`.

### Example:
    #bad
    def method_missing(name, *args)
      # ...
    end

    #good

    def method_missing(name, *args)
      # ...
      super
    end