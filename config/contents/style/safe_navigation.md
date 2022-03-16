This cop transforms usages of a method call safeguarded by a non `nil`
check for the variable whose method is being called to
safe navigation (`&.`). If there is a method chain, all of the methods
in the chain need to be checked for safety, and all of the methods will
need to be changed to use safe navigation.

The default for `ConvertCodeThatCanStartToReturnNil` is `false`.
When configured to `true`, this will
check for code in the format `!foo.nil? && foo.bar`. As it is written,
the return of this code is limited to `false` and whatever the return
of the method is. If this is converted to safe navigation,
`foo&.bar` can start returning `nil` as well as what the method
returns.

The default for `MaxChainLength` is `2`
We have limited the cop to not register an offense for method chains
that exceed this option is set.

### Safety:

Autocorrection is unsafe because if a value is `false`, the resulting
code will have different behaviour or raise an error.

```ruby
x = false
x && x.foo  # return false
x&.foo      # raises NoMethodError
```

### Example:
    # bad
    foo.bar if foo
    foo.bar.baz if foo
    foo.bar(param1, param2) if foo
    foo.bar { |e| e.something } if foo
    foo.bar(param) { |e| e.something } if foo

    foo.bar if !foo.nil?
    foo.bar unless !foo
    foo.bar unless foo.nil?

    foo && foo.bar
    foo && foo.bar.baz
    foo && foo.bar(param1, param2)
    foo && foo.bar { |e| e.something }
    foo && foo.bar(param) { |e| e.something }

    # good
    foo&.bar
    foo&.bar&.baz
    foo&.bar(param1, param2)
    foo&.bar { |e| e.something }
    foo&.bar(param) { |e| e.something }
    foo && foo.bar.baz.qux # method chain with more than 2 methods
    foo && foo.nil? # method that `nil` responds to

    # Method calls that do not use `.`
    foo && foo < bar
    foo < bar if foo

    # When checking `foo&.empty?` in a conditional, `foo` being `nil` will actually
    # do the opposite of what the author intends.
    foo && foo.empty?

    # This could start returning `nil` as well as the return of the method
    foo.nil? || foo.bar
    !foo || foo.bar

    # Methods that are used on assignment, arithmetic operation or
    # comparison should not be converted to use safe navigation
    foo.baz = bar if foo
    foo.baz + bar if foo
    foo.bar > 2 if foo