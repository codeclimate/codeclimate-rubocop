Checks if empty lines around the bodies of modules match
the configuration.

### Example: EnforcedStyle: no_empty_lines (default)
    # good

    module Foo
      def bar
        # ...
      end
    end

### Example: EnforcedStyle: empty_lines
    # good

    module Foo

      def bar
        # ...
      end

    end

### Example: EnforcedStyle: empty_lines_except_namespace
    # good

    module Foo
      module Bar

        # ...

      end
    end

### Example: EnforcedStyle: empty_lines_special
    # good
    module Foo

      def bar; end

    end