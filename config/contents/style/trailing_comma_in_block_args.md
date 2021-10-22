This cop checks whether trailing commas in block arguments are
required. Blocks with only one argument and a trailing comma require
that comma to be present. Blocks with more than one argument never
require a trailing comma.

### Safety:

This cop is unsafe because a trailing comma can indicate there are
more parameters that are not used.

For example:
```ruby
# with a trailing comma
{foo: 1, bar: 2, baz: 3}.map {|key,| key }
#=> [:foo, :bar, :baz]

# without a trailing comma
{foo: 1, bar: 2, baz: 3}.map {|key| key }
#=> [[:foo, 1], [:bar, 2], [:baz, 3]]
```

This can be fixed by replacing the trailing comma with a placeholder
argument (such as `|key, _value|`).

### Example:
    # bad
    add { |foo, bar,| foo + bar }

    # good
    add { |foo, bar| foo + bar }

    # good
    add { |foo,| foo }

    # good
    add { foo }

    # bad
    add do |foo, bar,|
      foo + bar
    end

    # good
    add do |foo, bar|
      foo + bar
    end

    # good
    add do |foo,|
      foo
    end

    # good
    add do
      foo + bar
    end