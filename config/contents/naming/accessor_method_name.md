Makes sure that accessor methods are named properly. Applies
to both instance and class methods.

NOTE: Offenses are only registered for methods with the expected
arity. Getters (`get_attribute`) must have no arguments to be
registered, and setters (`set_attribute(value)`) must have exactly
one.

### Example:
    # bad
    def set_attribute(value)
    end

    # good
    def attribute=(value)
    end

    # bad
    def get_attribute
    end

    # good
    def attribute
    end

    # accepted, incorrect arity for getter
    def get_value(attr)
    end

    # accepted, incorrect arity for setter
    def set_value
    end