This cop checks for use of `extend self` or `module_function` in a
module.

Supported styles are: module_function, extend_self.

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

These offenses are not auto-corrected since there are different
implications to each approach.