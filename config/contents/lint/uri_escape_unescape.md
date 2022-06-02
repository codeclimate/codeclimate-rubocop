Identifies places where `URI.escape` can be replaced by
`CGI.escape`, `URI.encode_www_form`, or `URI.encode_www_form_component`
depending on your specific use case.
Also this cop identifies places where `URI.unescape` can be replaced by
`CGI.unescape`, `URI.decode_www_form`,
or `URI.decode_www_form_component` depending on your specific use case.

### Example:
    # bad
    URI.escape('http://example.com')
    URI.encode('http://example.com')

    # good
    CGI.escape('http://example.com')
    URI.encode_www_form([['example', 'param'], ['lang', 'en']])
    URI.encode_www_form(page: 10, locale: 'en')
    URI.encode_www_form_component('http://example.com')

    # bad
    URI.unescape(enc_uri)
    URI.decode(enc_uri)

    # good
    CGI.unescape(enc_uri)
    URI.decode_www_form(enc_uri)
    URI.decode_www_form_component(enc_uri)