This cops checks if empty lines around the bodies of modules match
the configuration.

### Example:

    EnforcedStyle: empty_lines

    # good

    module Foo

      def bar
        ...
      end

    end

    EnforcedStyle: no_empty_lines

    # good

    module Foo
      def bar
        ...
      end
    end