This cops checks for use of `extend self` or `module_function` in a
module.

Supported styles are: module_function, extend_self.

### Example:

    # Good if EnforcedStyle is module_function
    module Test
      module_function
      ...
    end

    # Good if EnforcedStyle is extend_self
    module Test
      extend self
      ...
    end

These offenses are not auto-corrected since there are different
implications to each approach.