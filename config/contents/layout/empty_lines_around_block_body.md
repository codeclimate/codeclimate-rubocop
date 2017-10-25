This cops checks if empty lines around the bodies of blocks match
the configuration.

### Example:

    # EnforcedStyle: empty_lines

    # good

    foo do |bar|

      ...

    end

    # EnforcedStyle: no_empty_lines

    # good

    foo do |bar|
      ...
    end