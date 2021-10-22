Checks if the quotes used for quoted symbols match the configured defaults.
By default uses the same configuration as `Style/StringLiterals`; if that
cop is not enabled, the default `EnforcedStyle` is `single_quotes`.

String interpolation is always kept in double quotes.

Note: `Lint/SymbolConversion` can be used in parallel to ensure that symbols
are not quoted that don't need to be. This cop is for configuring the quoting
style to use for symbols that require quotes.

### Example: EnforcedStyle: same_as_string_literals (default) / single_quotes
    # bad
    :"abc-def"

    # good
    :'abc-def'
    :"#{str}"
    :"a\'b"

### Example: EnforcedStyle: double_quotes
    # bad
    :'abc-def'

    # good
    :"abc-def"
    :"#{str}"
    :"a\'b"