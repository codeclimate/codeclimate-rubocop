Use symbols as procs when possible.

If you prefer a style that allows block for method with arguments,
please set `true` to `AllowMethodsWithArguments`.

### Example:
    # bad
    something.map { |s| s.upcase }
    something.map { _1.upcase }

    # good
    something.map(&:upcase)

### Example: AllowMethodsWithArguments: false (default)
    # bad
    something.do_something(foo) { |o| o.bar }

    # good
    something.do_something(foo, &:bar)

### Example: AllowMethodsWithArguments: true
    # good
    something.do_something(foo) { |o| o.bar }