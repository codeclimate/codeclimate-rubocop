This cop checks for inconsistent indentation.

The difference between `rails` and `normal` is that the `rails` style
prescribes that in classes and modules the `protected` and `private`
modifier keywords shall be indented the same as public methods and that
protected and private members shall be indented one step more than the
modifiers. Other than that, both styles mean that entities on the same
logical depth shall have the same indentation.

### Example: EnforcedStyle: normal (default)
    # bad
    class A
      def test
        puts 'hello'
         puts 'world'
      end
    end

    # bad
    class A
      def test
        puts 'hello'
        puts 'world'
      end

      protected

        def foo
        end

      private

        def bar
        end
    end

    # good
    class A
      def test
        puts 'hello'
        puts 'world'
      end
    end

    # good
    class A
      def test
        puts 'hello'
        puts 'world'
      end

      protected

      def foo
      end

      private

      def bar
      end
    end

### Example: EnforcedStyle: rails
    # bad
    class A
      def test
        puts 'hello'
         puts 'world'
      end
    end

    # bad
    class A
      def test
        puts 'hello'
        puts 'world'
      end

      protected

      def foo
      end

      private

      def bar
      end
    end

    # good
    class A
      def test
        puts 'hello'
        puts 'world'
      end
    end

    # good
    class A
      def test
        puts 'hello'
        puts 'world'
      end

      protected

        def foo
        end

      private

        def bar
        end
    end