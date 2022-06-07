Checks if empty lines around the bodies of blocks match
the configuration.

### Example: EnforcedStyle: no_empty_lines (default)
    # good

    foo do |bar|
      # ...
    end

### Example: EnforcedStyle: empty_lines
    # good

    foo do |bar|

      # ...

    end