Checks for use of `extend self` or `module_function` in a module.

Supported styles are: `module_function` (default), `extend_self` and `forbidden`.

A couple of things to keep in mind:

- `forbidden` style prohibits the usage of both styles
- in default mode (`module_function`), the cop won't be activated when the module
    contains any private methods

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

    # good
    module Test
      extend self
      # ...
      private
      # ...
    end

    # good
    module Test
      class << self
        # ...
      end
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

    # good
    module Test
      class << self
        # ...
      end
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

    # good
    module Test
      class << self
        # ...
      end
    end