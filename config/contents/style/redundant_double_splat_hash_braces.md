Checks for redundant uses of double splat hash braces.

### Example:

    # bad
    do_something(**{foo: bar, baz: qux})

    # good
    do_something(foo: bar, baz: qux)

    # bad
    do_something(**{foo: bar, baz: qux}.merge(options))

    # good
    do_something(foo: bar, baz: qux, **options)
