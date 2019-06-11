This cop checks for the use of the read_attribute or write_attribute
methods, and recommends square brackets instead.

If an attribute is missing from the instance (for example, when
initialized by a partial `select`) then read_attribute will return nil,
but square brackets will raise an ActiveModel::MissingAttributeError.

Explicitly raising an error in this situation is preferable, and that
is why rubocop recommends using square brackets.

### Example:

    # bad
    x = read_attribute(:attr)
    write_attribute(:attr, val)

    # good
    x = self[:attr]
    self[:attr] = val