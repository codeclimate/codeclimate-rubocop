This cop looks for delegations that pass :allow_blank as an option
instead of :allow_nil. :allow_blank is not a valid option to pass
to ActiveSupport#delegate.

### Example:
    # bad
    delegate :foo, to: :bar, allow_blank: true

    # good
    delegate :foo, to: :bar, allow_nil: true