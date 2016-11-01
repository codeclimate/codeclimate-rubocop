This cop checks for the presence of `method_missing` without also
defining `respond_to_missing?` and falling back on `super`.

### Example:
    #bad
    def method_missing(...)
      ...
    end

    #good
    def respond_to_missing?(...)
      ...
    end

    def method_missing(...)
      ...
      super
    end