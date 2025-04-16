Checks for calls to `Kernel#format` or `Kernel#sprintf` that are redundant.

Calling `format` with only a single string or constant argument is redundant,
as it can be replaced by the string or constant itself.

Also looks for `format` calls where the arguments are literals that can be
inlined into a string easily. This applies to the `%s`, `%d`, `%i`, `%u`, and
`%f` format specifiers.

### Safety:

This cop's autocorrection is unsafe because string object returned by
`format` and `sprintf` are never frozen. If `format('string')` is autocorrected to
`'string'`, `FrozenError` may occur when calling a destructive method like `String#<<`.
Consider using `'string'.dup` instead of `format('string')`.
Additionally, since the necessity of `dup` cannot be determined automatically,
this autocorrection is inherently unsafe.

```ruby
# frozen_string_literal: true

format('template').frozen? # => false
'template'.frozen?         # => true
```

### Example:

    # bad
    format('the quick brown fox jumps over the lazy dog.')
    sprintf('the quick brown fox jumps over the lazy dog.')

    # good
    'the quick brown fox jumps over the lazy dog.'

    # bad
    format(MESSAGE)
    sprintf(MESSAGE)

    # good
    MESSAGE

    # bad
    format('%s %s', 'foo', 'bar')
    sprintf('%s %s', 'foo', 'bar')

    # good
    'foo bar'
