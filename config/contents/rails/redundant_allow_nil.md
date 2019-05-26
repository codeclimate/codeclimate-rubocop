Checks Rails model validations for a redundant `allow_nil` when
`allow_blank` is present.

### Example:
    # bad
    validates :x, length: { is: 5 }, allow_nil: true, allow_blank: true

    # bad
    validates :x, length: { is: 5 }, allow_nil: false, allow_blank: true

    # bad
    validates :x, length: { is: 5 }, allow_nil: false, allow_blank: false

    # good
    validates :x, length: { is: 5 }, allow_blank: true

    # good
    validates :x, length: { is: 5 }, allow_blank: false

    # good
    # Here, `nil` is valid but `''` is not
    validates :x, length: { is: 5 }, allow_nil: true, allow_blank: false
