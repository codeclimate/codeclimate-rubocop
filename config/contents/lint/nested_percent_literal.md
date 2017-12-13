This cop checks for nested percent literals.

### Example:

    # bad

    # The percent literal for nested_attributes is parsed as four tokens,
    # yielding the array [:name, :content, :"%i[incorrectly", :"nested]"].
    attributes = {
      valid_attributes: %i[name content],
      nested_attributes: %i[name content %i[incorrectly nested]]
    }