This cop checks that your heredocs are using the configured case.
By default it is configured to enforce uppercase heredocs.

### Example:

    # EnforcedStyle: uppercase (default)

    # good
    <<-SQL
      SELECT * FROM foo
    SQL

    # bad
    <<-sql
      SELECT * FROM foo
    sql

### Example:

    # EnforcedStyle: lowercase

    # good
    <<-sql
      SELECT * FROM foo
    sql

    # bad
    <<-SQL
      SELECT * FROM foo
    SQL