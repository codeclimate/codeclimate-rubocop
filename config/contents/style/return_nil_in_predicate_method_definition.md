Checks for predicate method definitions that return `nil`.
A predicate method should only return a boolean value.

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

    # bad
    def foo?
      if condition
        nil
      else
        true
      end
    end

    # good
    def foo?
      if condition
        false
      else
        true
      end
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
