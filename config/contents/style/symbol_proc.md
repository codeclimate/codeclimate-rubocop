Use symbols as procs when possible.

If you prefer a style that allows block for method with arguments,
please set `true` to `AllowMethodsWithArguments`.
respond_to , and `define_method?` methods are allowed by default.
These are customizable with `AllowedMethods` option.

### Safety:

This cop is unsafe because there is a difference that a `Proc`
generated from `Symbol#to_proc` behaves as a lambda, while
a `Proc` generated from a block does not.
For example, a lambda will raise an `ArgumentError` if the
number of arguments is wrong, but a non-lambda `Proc` will not.

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

### Example: AllowedMethods: [respond_to, define_method] (default)
    # good
    respond_to { |foo| foo.bar }
    define_method(:foo) { |foo| foo.bar }


### Example: AllowedPatterns: [] (default)
    # bad
    something.map { |s| s.upcase }

### Example: AllowedPatterns: ['map'] (default)
    # good
    something.map { |s| s.upcase }
