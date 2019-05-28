This cop checks for the ordering of a method call where
the receiver of the call is a HEREDOC.

### Example:
    # bad

       <<-SQL
         bar
       SQL
       .strip_indent

       <<-SQL
         bar
       SQL
       .strip_indent
       .trim

    # good

       <<-SQL.strip_indent
         bar
       SQL

       <<-SQL.strip_indent.trim
         bar
       SQL
