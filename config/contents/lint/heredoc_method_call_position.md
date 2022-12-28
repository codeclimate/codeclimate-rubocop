Checks for the ordering of a method call where
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
    <<~SQL
      bar
    SQL

    <<~SQL.trim
      bar
    SQL
