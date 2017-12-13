This cop checks code that can be written more easily using
`Object#presence` defined by Active Support.

### Example:
    # bad
    a.present? ? a : nil

    # bad
    !a.present? ? nil : a

    # bad
    a.blank? ? nil : a

    # bad
    !a.blank? ? a : nil

    # good
    a.presence

### Example:
    # bad
    a.present? ? a : b

    # bad
    !a.present? ? b : a

    # bad
    a.blank? ? b : a

    # bad
    !a.blank? ? a : b

    # good
    a.presence || b