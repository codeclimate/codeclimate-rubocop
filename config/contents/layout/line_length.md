This cop checks the length of lines in the source code.
The maximum length is configurable.
The tab size is configured in the `IndentationWidth`
of the `Layout/Tab` cop.
It also ignores a shebang line by default.

This cop has some autocorrection capabilities.
It can programmatically shorten certain long lines by
inserting line breaks into expressions that can be safely
split across lines. These include arrays, hashes, and
method calls with argument lists.

If autocorrection is enabled, the following Layout cops
are recommended to further format the broken lines.

    - ParameterAlignment
    - ArgumentAlignment
    - ClosingParenthesisIndentation
    - FirstArgumentIndentation
    - FirstArrayElementIndentation
    - FirstHashElementIndentation
    - FirstParameterIndentation
    - HashAlignment
    - MultilineArrayLineBreaks
    - MultilineHashBraceLayout
    - MultilineHashKeyLineBreaks
    - MultilineMethodArgumentLineBreaks

Together, these cops will pretty print hashes, arrays,
method calls, etc. For example, let's say the max columns
is 25:

### Example:

    # bad
    {foo: "0000000000", bar: "0000000000", baz: "0000000000"}

    # good
    {foo: "0000000000",
    bar: "0000000000", baz: "0000000000"}

    # good (with recommended cops enabled)
    {
      foo: "0000000000",
      bar: "0000000000",
      baz: "0000000000",
    }