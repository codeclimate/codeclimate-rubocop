This cop looks for error classes inheriting from `Exception`.
It is configurable to suggest using either `StandardError` (default) or
`RuntimeError` instead.

### Safety:

This cop's autocorrection is unsafe because `rescue` that omit
exception class handle `StandardError` and its subclasses,
but not `Exception` and its subclasses.

### Example: EnforcedStyle: standard_error (default)
    # bad

    class C < Exception; end

    C = Class.new(Exception)

    # good

    class C < StandardError; end

    C = Class.new(StandardError)

### Example: EnforcedStyle: runtime_error
    # bad

    class C < Exception; end

    C = Class.new(Exception)

    # good

    class C < RuntimeError; end

    C = Class.new(RuntimeError)