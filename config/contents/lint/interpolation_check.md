Checks for interpolation in a single quoted string.

### Safety:

This cop's autocorrection is unsafe because although it always replaces single quotes as
if it were miswritten double quotes, it is not always the case. For example,
`'#{foo} bar'` would be replaced by `"#{foo} bar"`, so the replaced code would evaluate
the expression `foo`.

### Example:

    # bad
    foo = 'something with #{interpolation} inside'

    # good
    foo = "something with #{interpolation} inside"