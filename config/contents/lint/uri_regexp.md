Identifies places where `URI.regexp` is obsolete and should
not be used. Instead, use `URI::DEFAULT_PARSER.make_regexp`.

### Example:
    # bad
    URI.regexp('http://example.com')

    # good
    URI::DEFAULT_PARSER.make_regexp('http://example.com')
