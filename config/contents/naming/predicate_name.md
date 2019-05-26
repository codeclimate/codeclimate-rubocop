This cop makes sure that predicates are named properly.

### Example:
    # bad
    def is_even(value)
    end

    def is_even?(value)
    end

    # good
    def even?(value)
    end

    # bad
    def has_value
    end

    def has_value?
    end

    # good
    def value?
    end