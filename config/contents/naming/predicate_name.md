Makes sure that predicates are named properly.
`is_a?` method is allowed by default.
These are customizable with `AllowedMethods` option.

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

### Example: AllowedMethods: ['is_a?'] (default)
    # good
    def is_a?(value)
    end
