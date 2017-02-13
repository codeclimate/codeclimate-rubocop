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

### Example:

    # good

    def duplicated
      1
    end

    def other_duplicated
      2
    end