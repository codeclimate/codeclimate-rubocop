Checks for `raise` or `fail` statements which raise `Exception` or
`Exception.new`. Use `StandardError` or a specific exception class instead.

If you have defined your own namespaced `Exception` class, it is possible
to configure the cop to allow it by setting `AllowedImplicitNamespaces` to
an array with the names of the namespaces to allow. By default, this is set to
`['Gem']`, which allows `Gem::Exception` to be raised without an explicit namespace.
If not allowed, a false positive may be registered if `raise Exception` is called
within the namespace.

Alternatively, use a fully qualified name with `raise`/`fail`
(eg. `raise Namespace::Exception`).

### Safety:

This cop is unsafe because it will change the exception class being
raised, which is a change in behavior.

### Example:
    # bad
    raise Exception, 'Error message here'
    raise Exception.new('Error message here')

    # good
    raise StandardError, 'Error message here'
    raise MyError.new, 'Error message here'

### Example: AllowedImplicitNamespaces: ['Gem'] (default)
    # bad - `Foo` is not an allowed implicit namespace
    module Foo
      def self.foo
        raise Exception # This is qualified to `Foo::Exception`.
      end
    end

    # good
    module Gem
      def self.foo
        raise Exception # This is qualified to `Gem::Exception`.
      end
    end

    # good
    module Foo
      def self.foo
        raise Foo::Exception
      end
    end