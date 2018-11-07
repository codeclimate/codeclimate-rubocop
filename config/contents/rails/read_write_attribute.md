This cop checks for the use of the read_attribute or
write_attribute methods.

### Example:

    # bad
    x = read_attribute(:attr)
    write_attribute(:attr, val)

    # good
    x = self[:attr]
    self[:attr] = val