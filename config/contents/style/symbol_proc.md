Use symbols as procs when possible.

If you prefer a style that allows block for method with arguments,
please set `true` to `AllowMethodsWithArguments`.
respond_to , and `define_method?` methods are ignored by default.
These are customizable with `IgnoredMethods` option.

### Safety:

This cop is unsafe because `proc`s and blocks work differently
when additional arguments are passed in. A block will silently
ignore additional arguments, but a `proc` will raise
an `ArgumentError`.

For example:

```ruby
class Foo
  def bar
    :bar
  end
end

def call(options = {}, &block)
  block.call(Foo.new, options)
end

call { |x| x.bar }
#=> :bar
call(&:bar)
# ArgumentError: wrong number of arguments (given 1, expected 0)
```

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

### Example: AllowComments: false (default)
    # bad
    something.do_something do |s| # some comment
      # some comment
      s.upcase # some comment
      # some comment
    end

### Example: AllowComments: true
    # good  - if there are comment in either position
    something.do_something do |s| # some comment
      # some comment
      s.upcase # some comment
      # some comment
    end

### Example: IgnoredMethods: [respond_to, define_method] (default)
    # good
    respond_to { |foo| foo.bar }
    define_method(:foo) { |foo| foo.bar }
