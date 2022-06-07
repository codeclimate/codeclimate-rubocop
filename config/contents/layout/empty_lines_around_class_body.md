Checks if empty lines around the bodies of classes match
the configuration.

### Example: EnforcedStyle: no_empty_lines (default)
    # good

    class Foo
      def bar
        # ...
      end
    end

### Example: EnforcedStyle: empty_lines
    # good

    class Foo

      def bar
        # ...
      end

    end

### Example: EnforcedStyle: empty_lines_except_namespace
    # good

    class Foo
      class Bar

        # ...

      end
    end

### Example: EnforcedStyle: empty_lines_special
    # good
    class Foo

      def bar; end

    end

### Example: EnforcedStyle: beginning_only
    # good

    class Foo

      def bar
        # ...
      end
    end

### Example: EnforcedStyle: ending_only
    # good

    class Foo
      def bar
        # ...
      end

    end