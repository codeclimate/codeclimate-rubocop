This cop checks that your heredocs are using meaningful delimiters.
By default it disallows `END` and `EO*`, and can be configured through
blacklisting additional delimiters.

### Example:

    # good
    <<-SQL
      SELECT * FROM foo
    SQL

    # bad
    <<-END
      SELECT * FROM foo
    END

    # bad
    <<-EOS
      SELECT * FROM foo
    EOS