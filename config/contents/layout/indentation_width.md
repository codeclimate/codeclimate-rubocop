Checks for indentation that doesn't use the specified number
of spaces.

See also the IndentationConsistency cop which is the companion to this
one.

### Example:
    # bad
    class A
     def test
      puts 'hello'
     end
    end

    # good
    class A
      def test
        puts 'hello'
      end
    end

### Example: AllowedPatterns: ['^\s*module']
    # bad
    module A
    class B
      def test
      puts 'hello'
      end
    end
    end

    # good
    module A
    class B
      def test
        puts 'hello'
      end
    end
    end