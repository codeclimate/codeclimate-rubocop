This cop checks for duplicated instance (or singleton) method
definitions.

### Example:
    # bad
    def duplicated
      1
    end

    def duplicated
      2
    end