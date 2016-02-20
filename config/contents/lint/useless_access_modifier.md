This cop checks for redundant access modifiers, including those with
no code, those which are repeated, and leading `public` modifiers in
a class or module body.

### Example:

    class Foo
      public # this is redundant

      def method
      end

      private # this is not redundant
      def method2
      end

      private # this is redundant
    end