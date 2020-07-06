Check that the keys, separators, and values of a multi-line hash
literal are aligned according to configuration. The configuration
options are:

* key (left align keys, one space before hash rockets and values)
* separator (align hash rockets and colons, right align keys)
* table (left align keys, hash rockets, and values)

The treatment of hashes passed as the last argument to a method call
can also be configured. The options are:

* always_inspect
* always_ignore
* ignore_implicit (without curly braces)

Alternatively you can specify multiple allowed styles. That's done by
passing a list of styles to EnforcedStyles.

### Example: EnforcedHashRocketStyle: key (default)
    # bad
    {
      :foo => bar,
       :ba => baz
    }
    {
      :foo => bar,
      :ba  => baz
    }

    # good
    {
      :foo => bar,
      :ba => baz
    }

### Example: EnforcedHashRocketStyle: separator
    # bad
    {
      :foo => bar,
      :ba => baz
    }
    {
      :foo => bar,
      :ba  => baz
    }

    # good
    {
      :foo => bar,
       :ba => baz
    }

### Example: EnforcedHashRocketStyle: table
    # bad
    {
      :foo => bar,
       :ba => baz
    }

    # good
    {
      :foo => bar,
      :ba  => baz
    }

### Example: EnforcedColonStyle: key (default)
    # bad
    {
      foo: bar,
       ba: baz
    }
    {
      foo: bar,
      ba:  baz
    }

    # good
    {
      foo: bar,
      ba: baz
    }

### Example: EnforcedColonStyle: separator
    # bad
    {
      foo: bar,
      ba: baz
    }

    # good
    {
      foo: bar,
       ba: baz
    }

### Example: EnforcedColonStyle: table
    # bad
    {
      foo: bar,
      ba: baz
    }

    # good
    {
      foo: bar,
      ba:  baz
    }

### Example: EnforcedLastArgumentHashStyle: always_inspect (default)
    # Inspect both implicit and explicit hashes.

    # bad
    do_something(foo: 1,
      bar: 2)

    # bad
    do_something({foo: 1,
      bar: 2})

    # good
    do_something(foo: 1,
                 bar: 2)

    # good
    do_something(
      foo: 1,
      bar: 2
    )

    # good
    do_something({foo: 1,
                  bar: 2})

    # good
    do_something({
      foo: 1,
      bar: 2
    })

### Example: EnforcedLastArgumentHashStyle: always_ignore
    # Ignore both implicit and explicit hashes.

    # good
    do_something(foo: 1,
      bar: 2)

    # good
    do_something({foo: 1,
      bar: 2})

### Example: EnforcedLastArgumentHashStyle: ignore_implicit
    # Ignore only implicit hashes.

    # bad
    do_something({foo: 1,
      bar: 2})

    # good
    do_something(foo: 1,
      bar: 2)

### Example: EnforcedLastArgumentHashStyle: ignore_explicit
    # Ignore only explicit hashes.

    # bad
    do_something(foo: 1,
      bar: 2)

    # good
    do_something({foo: 1,
      bar: 2})
