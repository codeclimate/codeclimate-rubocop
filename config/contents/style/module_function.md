Checks for use of `extend self` or `module_function` in a
module.

Supported styles are: module_function, extend_self, forbidden. `forbidden`
style prohibits the usage of both styles.

NOTE: the cop won't be activated when the module contains any private methods.

### Safety:

Autocorrection is unsafe (and is disabled by default) because `extend self`
and `module_function` do not behave exactly the same.

### Example: EnforcedStyle: module_function (default)
    # bad
    module Test
      extend self
      # ...
    end

    # good
    module Test
      module_function
      # ...
    end

### Example: EnforcedStyle: module_function (default)
    # good
    module Test
      extend self
      # ...
      private
      # ...
    end

### Example: EnforcedStyle: extend_self
    # bad
    module Test
      module_function
      # ...
    end

    # good
    module Test
      extend self
      # ...
    end

### Example: EnforcedStyle: forbidden
    # bad
    module Test
      module_function
      # ...
    end

    # bad
    module Test
      extend self
      # ...
    end

    # bad
    module Test
      extend self
      # ...
      private
      # ...
    end