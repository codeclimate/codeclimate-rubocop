Identifies places where `$stderr.puts` can be replaced by
`warn`. The latter has the advantage of easily being disabled by,
the `-W0` interpreter flag or setting `$VERBOSE` to `nil`.

### Example:
    # bad
    $stderr.puts('hello')

    # good
    warn('hello')
