Detects the use of the `public_send` method with a literal method name argument.
Since the `send` method can be used to call private methods, by default,
only the `public_send` method is detected.

NOTE: Writer methods with names ending in `=` are always permitted because their
behavior differs as follows:

```ruby
def foo=(foo)
  @foo = foo
  42
end

self.foo = 1   # => 1
send(:foo=, 1) # => 42
```

### Safety:

This cop is not safe because it can incorrectly detect based on the receiver.
Additionally, when `AllowSend` is set to `true`, it cannot determine whether
the `send` method being detected is calling a private method.

### Example:
    # bad
    obj.public_send(:method_name)
    obj.public_send('method_name')

    # good
    obj.method_name

### Example: AllowSend: true (default)
    # good
    obj.send(:method_name)
    obj.send('method_name')
    obj.__send__(:method_name)
    obj.__send__('method_name')

### Example: AllowSend: false
    # bad
    obj.send(:method_name)
    obj.send('method_name')
    obj.__send__(:method_name)
    obj.__send__('method_name')

    # good
    obj.method_name
