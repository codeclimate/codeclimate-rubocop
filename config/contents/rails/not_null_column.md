This cop checks for add_column call with NOT NULL constraint
in migration file.

### Example:
    # bad
    add_column :users, :name, :string, null: false

    # good
    add_column :users, :name, :string, null: true
    add_column :users, :name, :string, null: false, default: ''