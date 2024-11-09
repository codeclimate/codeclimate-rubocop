Checks for calls to `defined?` with strings or symbols as the argument.
Such calls will always return `'expression'`, you probably meant to
check for the existence of a constant, method, or variable instead.

`defined?` is part of the Ruby syntax and doesn't behave like normal methods.
You can safely pass in what you are checking for directly, without encountering
a `NameError`.

When interpolation is used, oftentimes it is not possible to write the
code with `defined?`. In these cases, switch to one of the more specific methods:

* `class_variable_defined?`
* `const_defined?`
* `method_defined?`
* `instance_variable_defined?`
* `binding.local_variable_defined?`

### Example:

    # bad
    defined?('FooBar')
    defined?(:FooBar)
    defined?(:foo_bar)
    defined?('foo_bar')

    # good
    defined?(FooBar)
    defined?(foo_bar)

    # bad - interpolation
    bar = 'Bar'
    defined?("Foo::#{bar}::Baz")

    # good
    bar = 'Bar'
    defined?(Foo) && Foo.const_defined?(bar) && Foo.const_get(bar).const_defined?(:Baz)