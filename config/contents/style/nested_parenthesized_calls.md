Checks for unparenthesized method calls in the argument list
of a parenthesized method call.
`be`, `be_a`, `be_an`, `be_between`, `be_falsey`, `be_kind_of`, `be_instance_of`,
`be_truthy`, `be_within`, `eq`, `eql`, `end_with`, `include`, `match`, `raise_error`,
`respond_to`, and `start_with` methods are allowed by default.
These are customizable with `AllowedMethods` option.

### Example:
    # good
    method1(method2(arg))

    # bad
    method1(method2 arg)

### Example: AllowedMethods: [foo]
    # good
    method1(foo arg)
