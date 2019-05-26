This cop looks for error classes inheriting from `Exception`
and its standard library subclasses, excluding subclasses of
`StandardError`. It is configurable to suggest using either
`RuntimeError` (default) or `StandardError` instead.

### Example: EnforcedStyle: runtime_error (default)
    # bad

    class C < Exception; end

    C = Class.new(Exception)

    # good

    class C < RuntimeError; end

    C = Class.new(RuntimeError)

### Example: EnforcedStyle: standard_error
    # bad

    class C < Exception; end

    C = Class.new(Exception)

    # good

    class C < StandardError; end

    C = Class.new(StandardError)