This cop checks for extra/unnecessary whitespace.

### Example:

    # good if AllowForAlignment is true
    name      = "RuboCop"
    # Some comment and an empty line

    website  += "/rubocop-hq/rubocop" unless cond
    puts        "rubocop"          if     debug

    # bad for any configuration
    set_app("RuboCop")
    website  = "https://github.com/rubocop-hq/rubocop"