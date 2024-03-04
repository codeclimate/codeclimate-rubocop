Checks for uses of literal strings converted to
a symbol where a literal symbol could be used instead.

There are two possible styles for this cop.
`strict` (default) will register an offense for any incorrect usage.
`consistent` additionally requires hashes to use the same style for
every symbol key (ie. if any symbol key needs to be quoted it requires
all keys to be quoted).

### Example:
    # bad
    'string'.to_sym
    :symbol.to_sym
    'underscored_string'.to_sym
    :'underscored_symbol'
    'hyphenated-string'.to_sym
    "string_#{interpolation}".to_sym

    # good
    :string
    :symbol
    :underscored_string
    :underscored_symbol
    :'hyphenated-string'
    :"string_#{interpolation}"

### Example: EnforcedStyle: strict (default)

    # bad
    {
      'a': 1,
      "b": 2,
      'c-d': 3
    }

    # good (don't quote keys that don't require quoting)
    {
      a: 1,
      b: 2,
      'c-d': 3
    }

### Example: EnforcedStyle: consistent

    # bad
    {
      a: 1,
      'b-c': 2
    }

    # good (quote all keys if any need quoting)
    {
      'a': 1,
      'b-c': 2
    }

    # good (no quoting required)
    {
      a: 1,
      b: 2
    }
