Checks for usages of `Hash#reject`, `Hash#select`, and `Hash#filter` methods
that can be replaced with `Hash#except` method.

This cop should only be enabled on Ruby version 3.0 or higher.
(`Hash#except` was added in Ruby 3.0.)

For safe detection, it is limited to commonly used string and symbol comparisons
when used `==`.
And do not check `Hash#delete_if` and `Hash#keep_if` to change receiver object.

### Example:

    # bad
    {foo: 1, bar: 2, baz: 3}.reject {|k, v| k == :bar }
    {foo: 1, bar: 2, baz: 3}.select {|k, v| k != :bar }
    {foo: 1, bar: 2, baz: 3}.filter {|k, v| k != :bar }
    {foo: 1, bar: 2, baz: 3}.reject {|k, v| %i[foo bar].include?(k) }
    {foo: 1, bar: 2, baz: 3}.select {|k, v| !%i[foo bar].include?(k) }
    {foo: 1, bar: 2, baz: 3}.filter {|k, v| !%i[foo bar].include?(k) }

    # good
    {foo: 1, bar: 2, baz: 3}.except(:bar)
