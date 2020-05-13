This cop checks for `raise` or `fail` statements which are
raising `Exception` class.

You can specify a module name that will be an implicit namespace
using `AllowedImplicitNamespaces` option. The cop cause a false positive
for namespaced `Exception` when a namespace is omitted. This option can
prevent the false positive by specifying a namespace to be omitted for
`Exception`. Alternatively, make `Exception` a fully qualified class
name with an explicit namespace.

### Example:
    # bad
    raise Exception, 'Error message here'

    # good
    raise StandardError, 'Error message here'

### Example: AllowedImplicitNamespaces: ['Gem']
    # good
    module Gem
      def self.foo
        raise Exception # This exception means `Gem::Exception`.
      end
    end