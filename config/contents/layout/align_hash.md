Check that the keys, separators, and values of a multi-line hash
literal are aligned according to configuration. The configuration
options are:

    - key (left align keys)
    - separator (align hash rockets and colons, right align keys)
    - table (left align keys, hash rockets, and values)

The treatment of hashes passed as the last argument to a method call
can also be configured. The options are:

    - always_inspect
    - always_ignore
    - ignore_implicit (without curly braces)
    - ignore_explicit (with curly braces)

### Example:

    # EnforcedHashRocketStyle: key (default)
    # EnforcedColonStyle: key (default)

    # good
    {
      foo: bar,
      ba: baz
    }
    {
      :foo => bar,
      :ba => baz
    }

    # bad
    {
      foo: bar,
       ba: baz
    }
    {
      :foo => bar,
       :ba => baz
    }

### Example:

    # EnforcedHashRocketStyle: separator
    # EnforcedColonStyle: separator

    #good
    {
      foo: bar,
       ba: baz
    }
    {
      :foo => bar,
       :ba => baz
    }

    #bad
    {
      foo: bar,
      ba: baz
    }
    {
      :foo => bar,
      :ba => baz
    }
    {
      :foo => bar,
      :ba  => baz
    }

### Example:

    # EnforcedHashRocketStyle: table
    # EnforcedColonStyle: table

    #good
    {
      foo: bar,
      ba:  baz
    }
    {
      :foo => bar,
      :ba  => baz
    }

    #bad
    {
      foo: bar,
      ba: baz
    }
    {
      :foo => bar,
       :ba => baz
    }