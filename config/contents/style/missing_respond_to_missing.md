Checks for the presence of `method_missing` without also
defining `respond_to_missing?`.

### Example:
    # bad
    def method_missing(name, *args)
      # ...
    end

    # good
    def respond_to_missing?(name, include_private)
      # ...
    end

    def method_missing(name, *args)
      # ...
    end
