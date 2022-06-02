Checks that your heredocs are using the configured case.
By default it is configured to enforce uppercase heredocs.

### Example: EnforcedStyle: uppercase (default)
    # bad
    <<-sql
      SELECT * FROM foo
    sql

    # good
    <<-SQL
      SELECT * FROM foo
    SQL

### Example: EnforcedStyle: lowercase
    # bad
    <<-SQL
      SELECT * FROM foo
    SQL

    # good
    <<-sql
      SELECT * FROM foo
    sql