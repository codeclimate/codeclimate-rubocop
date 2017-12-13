This cop checks that Rails.env is compared using `.production?`-like
methods instead of equality against a string or symbol.

### Example:
    # bad
    Rails.env == 'production'

    # bad, always returns false
    Rails.env == :test

    # good
    Rails.env.production?