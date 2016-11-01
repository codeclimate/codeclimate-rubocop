This cop looks for error classes inheriting from `Exception`
and its standard library subclasses, excluding subclasses of
`StandardError`. It is configurable to suggest using either
`RuntimeError` (default) or `StandardError` instead.

### Example:

    # bad

    class C < Exception; end

### Example:

    # EnforcedStyle: runtime_error (default)

    # good

    class C < RuntimeError; end

### Example:

    # EnforcedStyle: standard_error

    # good

    class C < StandardError; end