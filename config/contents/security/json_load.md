This cop checks for the use of JSON class methods which have potential
security issues.

### Safety:

This cop's autocorrection is unsafe because it's potentially dangerous.
If using a stream, like `JSON.load(open('file'))`, it will need to call
`#read` manually, like `JSON.parse(open('file').read)`.
If reading single values (rather than proper JSON objects), like
`JSON.load('false')`, it will need to pass the `quirks_mode: true`
option, like `JSON.parse('false', quirks_mode: true)`.
Other similar issues may apply.

### Example:
    # bad
    JSON.load("{}")
    JSON.restore("{}")

    # good
    JSON.parse("{}")
