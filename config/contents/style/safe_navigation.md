This cop transforms usages of a method call safeguarded by a non `nil`
check for the variable whose method is being called to
safe navigation (`&.`).

Configuration option: ConvertCodeThatCanStartToReturnNil
The default for this is `false`. When configured to `true`, this will
check for code in the format `!foo.nil? && foo.bar`. As it is written,
the return of this code is limited to `false` and whatever the return
of the method is. If this is converted to safe navigation,
`foo&.bar` can start returning `nil` as well as what the method
returns.

### Example:
    # bad
    foo.bar if foo
    foo.bar(param1, param2) if foo
    foo.bar { |e| e.something } if foo
    foo.bar(param) { |e| e.something } if foo

    foo.bar if !foo.nil?
    foo.bar unless !foo
    foo.bar unless foo.nil?

    foo && foo.bar
    foo && foo.bar(param1, param2)
    foo && foo.bar { |e| e.something }
    foo && foo.bar(param) { |e| e.something }

    # good
    foo&.bar
    foo&.bar(param1, param2)
    foo&.bar { |e| e.something }
    foo&.bar(param) { |e| e.something }

    foo.nil? || foo.bar
    !foo || foo.bar

    # Methods that `nil` will `respond_to?` should not be converted to
    # use safe navigation
    foo.to_i if foo