This cop checks that environments called with `Rails.env` predicates
exist.

### Example:
    # bad
    Rails.env.proudction?

    # good
    Rails.env.production?