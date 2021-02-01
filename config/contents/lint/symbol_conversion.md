This cop checks for uses of literal strings converted to
a symbol where a literal symbol could be used instead.

### Example:
    # bad
    'string'.to_sym
    :symbol.to_sym
    'underscored_string'.to_sym
    :'underscored_symbol'
    'hyphenated-string'.to_sym

    # good
    :string
    :symbol
    :underscored_string
    :underscored_symbol
    :'hyphenated-string'
