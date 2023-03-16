Checks for array literals made up of word-like
strings, that are not using the %w() syntax.

Alternatively, it can check for uses of the %w() syntax, in projects
which do not want to include that syntax.

NOTE: When using the `percent` style, %w() arrays containing a space
will be registered as offenses.

Configuration option: MinSize
If set, arrays with fewer elements than this value will not trigger the
cop. For example, a `MinSize` of `3` will not enforce a style on an
array of 2 or fewer elements.

### Example: EnforcedStyle: percent (default)
    # good
    %w[foo bar baz]

    # bad
    ['foo', 'bar', 'baz']

    # bad (contains spaces)
    %w[foo\ bar baz\ quux]

    # bad
    [
      ['one', 'One'],
      ['two', 'Two']
    ]

    # good
    [
      %w[one One],
      %w[two Two]
    ]

    # good (2d array containing spaces)
    [
      ['one', 'One'],
      ['two', 'Two'],
      ['forty two', 'Forty Two']
    ]

### Example: EnforcedStyle: brackets
    # good
    ['foo', 'bar', 'baz']

    # bad
    %w[foo bar baz]

    # good (contains spaces)
    ['foo bar', 'baz quux']

    # good
    [
      ['one', 'One'],
      ['two', 'Two']
    ]

    # bad
    [
      %w[one One],
      %w[two Two]
    ]
