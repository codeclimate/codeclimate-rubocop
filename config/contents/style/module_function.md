This cop checks for use of `extend self` or `module_function` in a
module.

Supported styles are: module_function, extend_self, forbidden.

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

In case there are private methods, the cop won't be activated.
Otherwise, it forces to change the flow of the default code.

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

The option `forbidden` prohibits the usage of both styles.

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

These offenses are not safe to auto-correct since there are different
implications to each approach.