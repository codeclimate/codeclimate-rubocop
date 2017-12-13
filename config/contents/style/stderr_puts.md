This cop identifies places where `$stderr.puts` can be replaced by
`warn`. The latter has the advantage of easily being disabled by,
e.g. the -W0 interpreter flag, or setting $VERBOSE to nil.

### Example:
    # bad
    $stderr.puts('hello')

    # good
    warn('hello')
