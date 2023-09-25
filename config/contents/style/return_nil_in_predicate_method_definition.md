Checks if `return` or `return nil` is used in predicate method definitions.

### Safety:

Autocorrection is marked as unsafe because the change of the return value
from `nil` to `false` could potentially lead to incompatibility issues.

### Example:
    # bad
    def foo?
      return if condition

      do_something?
    end

    # bad
    def foo?
      return nil if condition

      do_something?
    end

    # good
    def foo?
      return false if condition

      do_something?
    end

### Example: AllowedMethods: ['foo?']
    # good
    def foo?
      return if condition

      do_something?
    end

### Example: AllowedPatterns: [/foo/]
    # good
    def foo?
      return if condition

      do_something?
    end
