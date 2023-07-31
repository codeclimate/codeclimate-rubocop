Checks for `send`, `public_send`, and `__send__` methods
when using mix-in.

`include` and `prepend` methods were private methods until Ruby 2.0,
they were mixed-in via `send` method. This cop uses Ruby 2.1 or
higher style that can be called by public methods.
And `extend` method that was originally a public method is also targeted
for style unification.

### Example:
    # bad
    Foo.send(:include, Bar)
    Foo.send(:prepend, Bar)
    Foo.send(:extend, Bar)

    # bad
    Foo.public_send(:include, Bar)
    Foo.public_send(:prepend, Bar)
    Foo.public_send(:extend, Bar)

    # bad
    Foo.__send__(:include, Bar)
    Foo.__send__(:prepend, Bar)
    Foo.__send__(:extend, Bar)

    # good
    Foo.include Bar
    Foo.prepend Bar
    Foo.extend Bar
