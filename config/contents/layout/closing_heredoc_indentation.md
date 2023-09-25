Checks the indentation of here document closings.

### Example:

    # bad
    class Foo
      def bar
        <<~SQL
          'Hi'
      SQL
      end
    end

    # good
    class Foo
      def bar
        <<~SQL
          'Hi'
        SQL
      end
    end

    # bad

    # heredoc contents is before closing heredoc.
    foo arg,
        <<~EOS
      Hi
        EOS

    # good
    foo arg,
        <<~EOS
      Hi
    EOS

    # good
    foo arg,
        <<~EOS
          Hi
        EOS
