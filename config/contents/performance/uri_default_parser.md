This cop identifies places where `URI::Parser.new`
can be replaced by `URI::DEFAULT_PARSER`.

### Example:
    # bad
    URI::Parser.new

    # good
    URI::DEFAULT_PARSER
