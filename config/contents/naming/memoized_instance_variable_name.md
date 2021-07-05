This cop checks for memoized methods whose instance variable name
does not match the method name. Applies to both regular methods
(defined with `def`) and dynamic methods (defined with
`define_method` or `define_singleton_method`).

This cop can be configured with the EnforcedStyleForLeadingUnderscores
directive. It can be configured to allow for memoized instance variables
prefixed with an underscore. Prefixing ivars with an underscore is a
convention that is used to implicitly indicate that an ivar should not
be set or referenced outside of the memoization method.

### Example: EnforcedStyleForLeadingUnderscores: disallowed (default)
    # bad
    # Method foo is memoized using an instance variable that is
    # not `@foo`. This can cause confusion and bugs.
    def foo
      @something ||= calculate_expensive_thing
    end

    def foo
      return @something if defined?(@something)
      @something = calculate_expensive_thing
    end

    # good
    def _foo
      @foo ||= calculate_expensive_thing
    end

    # good
    def foo
      @foo ||= calculate_expensive_thing
    end

    # good
    def foo
      @foo ||= begin
        calculate_expensive_thing
      end
    end

    # good
    def foo
      helper_variable = something_we_need_to_calculate_foo
      @foo ||= calculate_expensive_thing(helper_variable)
    end

    # good
    define_method(:foo) do
      @foo ||= calculate_expensive_thing
    end

    # good
    define_method(:foo) do
      return @foo if defined?(@foo)
      @foo = calculate_expensive_thing
    end

### Example: EnforcedStyleForLeadingUnderscores: required
    # bad
    def foo
      @something ||= calculate_expensive_thing
    end

    # bad
    def foo
      @foo ||= calculate_expensive_thing
    end

    def foo
      return @foo if defined?(@foo)
      @foo = calculate_expensive_thing
    end

    # good
    def foo
      @_foo ||= calculate_expensive_thing
    end

    # good
    def _foo
      @_foo ||= calculate_expensive_thing
    end

    def foo
      return @_foo if defined?(@_foo)
      @_foo = calculate_expensive_thing
    end

    # good
    define_method(:foo) do
      @_foo ||= calculate_expensive_thing
    end

    # good
    define_method(:foo) do
      return @_foo if defined?(@_foo)
      @_foo = calculate_expensive_thing
    end

### Example: EnforcedStyleForLeadingUnderscores :optional
    # bad
    def foo
      @something ||= calculate_expensive_thing
    end

    # good
    def foo
      @foo ||= calculate_expensive_thing
    end

    # good
    def foo
      @_foo ||= calculate_expensive_thing
    end

    # good
    def _foo
      @_foo ||= calculate_expensive_thing
    end

    # good
    def foo
      return @_foo if defined?(@_foo)
      @_foo = calculate_expensive_thing
    end

    # good
    define_method(:foo) do
      @foo ||= calculate_expensive_thing
    end

    # good
    define_method(:foo) do
      @_foo ||= calculate_expensive_thing
    end

This cop relies on the pattern `@instance_var ||= ...`,
but this is sometimes used for other purposes than memoization
so this cop is considered unsafe.