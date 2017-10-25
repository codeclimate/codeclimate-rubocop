This cop makes sure that accessor methods are named properly.

### Example:
    # bad
    def set_attribute(value) ...

    # good
    def attribute=(value)

    # bad
    def get_attribute ...

    # good
    def attribute ...