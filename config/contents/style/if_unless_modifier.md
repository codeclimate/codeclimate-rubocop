Checks for `if` and `unless` statements that would fit on one line if
written as modifier `if`/`unless`. The cop also checks for modifier
`if`/`unless` lines that exceed the maximum line length.

The maximum line length is configured in the `Layout/LineLength`
cop. The tab size is configured in the `IndentationWidth` of the
`Layout/IndentationStyle` cop.

One-line pattern matching is always allowed. To ensure that there are few cases
where the match variable is not used, and to prevent oversights. The variable `x`
becomes undefined and raises `NameError` when the following example is changed to
the modifier form:

```ruby
if [42] in [x]
  x # `x` is undefined when using modifier form.
end
```

NOTE: It is allowed when `defined?` argument has an undefined value,
because using the modifier form causes the following incompatibility:

```ruby
unless defined?(undefined_foo)
  undefined_foo = 'default_value'
end
undefined_foo # => 'default_value'

undefined_bar = 'default_value' unless defined?(undefined_bar)
undefined_bar # => nil
```

### Example:
    # bad
    if condition
      do_stuff(bar)
    end

    unless qux.empty?
      Foo.do_something
    end

    do_something_with_a_long_name(arg) if long_condition_that_prevents_code_fit_on_single_line

    # good
    do_stuff(bar) if condition
    Foo.do_something unless qux.empty?

    if long_condition_that_prevents_code_fit_on_single_line
      do_something_with_a_long_name(arg)
    end

    if short_condition # a long comment that makes it too long if it were just a single line
      do_something
    end