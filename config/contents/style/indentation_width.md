This cops checks for indentation that doesn't use the specified number
of spaces.

See also the IndentationConsistency cop which is the companion to this
one.

### Example:
    # bad, Width: 2
    class A
     def test
      puts 'hello'
     end
    end

    # bad, Width: 2,
           IgnoredPatterns:
             - '^\s*module'
    module A
    class B
      def test
      puts 'hello'
      end
    end
    end

    # good, Width: 2
    class A
      def test
        puts 'hello'
      end
    end

    # good, Width: 2,
            IgnoredPatterns:
              - '^\s*module'
    module A
    class B
      def test
        puts 'hello'
      end
    end
    end