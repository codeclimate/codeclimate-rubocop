Checks for redundant access modifiers, including those with no
code, those which are repeated, and leading `public` modifiers in a
class or module body. Conditionally-defined methods are considered as
always being defined, and thus access modifiers guarding such methods
are not redundant.

This cop has `ContextCreatingMethods` option. The default setting value
is an empty array that means no method is specified.
This setting is an array of methods which, when called, are known to
create its own context in the module's current access context.

It also has `MethodCreatingMethods` option. The default setting value
is an empty array that means no method is specified.
This setting is an array of methods which, when called, are known to
create other methods in the module's current access context.

### Example:
    # bad
    class Foo
      public # this is redundant (default access is public)

      def method
      end
    end

    # bad
    class Foo
      # The following is redundant (methods defined on the class'
      # singleton class are not affected by the private modifier)
      private

      def self.method3
      end
    end

    # bad
    class Foo
      protected

      define_method(:method2) do
      end

      protected # this is redundant (repeated from previous modifier)

      [1,2,3].each do |i|
        define_method("foo#{i}") do
        end
      end
    end

    # bad
    class Foo
      private # this is redundant (no following methods are defined)
    end

    # good
    class Foo
      private # this is not redundant (a method is defined)

      def method2
      end
    end

    # good
    class Foo
      # The following is not redundant (conditionally defined methods are
      # considered as always defining a method)
      private

      if condition?
        def method
        end
      end
    end

    # good
    class Foo
      protected # this is not redundant (a method is defined)

      define_method(:method2) do
      end
    end

### Example: ContextCreatingMethods: concerning
    # Lint/UselessAccessModifier:
    #   ContextCreatingMethods:
    #     - concerning

    # good
    require 'active_support/concern'
    class Foo
      concerning :Bar do
        def some_public_method
        end

        private

        def some_private_method
        end
      end

      # this is not redundant because `concerning` created its own context
      private

      def some_other_private_method
      end
    end

### Example: MethodCreatingMethods: delegate
    # Lint/UselessAccessModifier:
    #   MethodCreatingMethods:
    #     - delegate

    # good
    require 'active_support/core_ext/module/delegation'
    class Foo
      # this is not redundant because `delegate` creates methods
      private

      delegate :method_a, to: :method_b
    end