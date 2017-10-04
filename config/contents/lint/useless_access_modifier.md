This cop checks for redundant access modifiers, including those with no
code, those which are repeated, and leading `public` modifiers in a
class or module body. Conditionally-defined methods are considered as
always being defined, and thus access modifiers guarding such methods
are not redundant.

### Example:

    class Foo
      public # this is redundant (default access is public)

      def method
      end

      private # this is not redundant (a method is defined)
      def method2
      end

      private # this is redundant (no following methods are defined)
    end

### Example:

    class Foo
      # The following is not redundant (conditionally defined methods are
      # considered as always defining a method)
      private

      if condition?
        def method
        end
      end

      protected # this is not redundant (method is defined)

      define_method(:method2) do
      end

      protected # this is redundant (repeated from previous modifier)

      [1,2,3].each do |i|
        define_method("foo#{i}") do
        end
      end

      # The following is redundant (methods defined on the class'
      # singleton class are not affected by the public modifier)
      public

      def self.method3
      end
    end

### Example:
    # Lint/UselessAccessModifier:
    #   ContextCreatingMethods:
    #     - concerning
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

### Example:
    # Lint/UselessAccessModifier:
    #   MethodCreatingMethods:
    #     - delegate
    require 'active_support/core_ext/module/delegation'
    class Foo
      # this is not redundant because `delegate` creates methods
      private

      delegate :method_a, to: :method_b
    end