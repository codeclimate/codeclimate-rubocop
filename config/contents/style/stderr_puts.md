This cop identifies places where `$stderr.puts`
can be replaced by `warn`.

### Example:
    # bad
    $stderr.puts('hello')

    # good
    warn('hello')
