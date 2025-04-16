Identifies places where `URI.regexp` is obsolete and should not be used.

For Ruby 3.3 or lower, use `URI::DEFAULT_PARSER.make_regexp`.
For Ruby 3.4 or higher, use `URI::RFC2396_PARSER.make_regexp`.

NOTE: If you need to support both Ruby 3.3 and lower as well as Ruby 3.4 and higher,
consider manually changing the code as follows:

```ruby
defined?(URI::RFC2396_PARSER) ? URI::RFC2396_PARSER : URI::DEFAULT_PARSER
```

### Example:
    # bad
    URI.regexp('http://example.com')

    # good - Ruby 3.3 or lower
    URI::DEFAULT_PARSER.make_regexp('http://example.com')

    # good - Ruby 3.4 or higher
    URI::RFC2396_PARSER.make_regexp('http://example.com')
