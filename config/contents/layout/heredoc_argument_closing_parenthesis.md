Checks for the placement of the closing parenthesis
in a method call that passes a HEREDOC string as an argument.
It should be placed at the end of the line containing the
opening HEREDOC tag.

### Example:
    # bad

       foo(<<-SQL
         bar
       SQL
       )

       foo(<<-SQL, 123, <<-NOSQL,
         bar
       SQL
         baz
       NOSQL
       )

       foo(
         bar(<<-SQL
           baz
         SQL
         ),
         123,
       )

    # good

       foo(<<-SQL)
         bar
       SQL

       foo(<<-SQL, 123, <<-NOSQL)
         bar
       SQL
         baz
       NOSQL

       foo(
         bar(<<-SQL),
           baz
         SQL
         123,
       )
