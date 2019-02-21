The symbol argument `:gemcutter`, `:rubygems`, and `:rubyforge`
are deprecated. So please change your source to URL string that
'https://rubygems.org' if possible, or 'http://rubygems.org' if not.

This autocorrect will replace these symbols with 'https://rubygems.org'.
Because it is secure, HTTPS request is strongly recommended. And in
most use cases HTTPS will be fine.

However, it don't replace all `sources` of `http://` with `https://`.
For example, when specifying an internal gem server using HTTP on the
intranet, a use case where HTTPS can not be specified was considered.
Consider using HTTP only if you can not use HTTPS.

### Example:
    # bad
    source :gemcutter
    source :rubygems
    source :rubyforge

    # good
    source 'https://rubygems.org' # strongly recommended
    source 'http://rubygems.org'