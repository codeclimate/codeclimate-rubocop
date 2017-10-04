This cop checks whether the change method of the migration file is
reversible.

### Example:
    # bad
    def change
      change_table :users do |t|
        t.remove :name
      end
    end

    # good
    def change
      create_table :users do |t|
        t.string :name
      end
    end

    # good
    def change
      reversible do |dir|
        change_table :users do |t|
          dir.up do
            t.column :name, :string
          end

          dir.down do
            t.remove :name
          end
        end
      end
    end

### Example:
    # drop_table

    # bad
    def change
      drop_table :users
    end

    # good
    def change
      drop_table :users do |t|
        t.string :name
      end
    end

### Example:
    # change_column_default

    # bad
    def change
      change_column_default(:suppliers, :qualification, 'new')
    end

    # good
    def change
      change_column_default(:posts, :state, from: nil, to: "draft")
    end

### Example:
    # remove_column

    # bad
    def change
      remove_column(:suppliers, :qualification)
    end

    # good
    def change
      remove_column(:suppliers, :qualification, :string)
    end

### Example:
    # remove_foreign_key

    # bad
    def change
      remove_foreign_key :accounts, column: :owner_id
    end

    # good
    def change
      remove_foreign_key :accounts, :branches
    end

### Example:
    # change_table

    # bad
    def change
      change_table :users do |t|
        t.remove :name
        t.change_default :authorized, 1
        t.change :price, :string
      end
    end

    # good
    def change
      change_table :users do |t|
        t.string :name
      end
    end

    # good
    def change
      reversible do |dir|
        change_table :users do |t|
          dir.up do
            t.change :price, :string
          end

          dir.down do
            t.change :price, :integer
          end
        end
      end
    end

@see http://api.rubyonrails.org/classes/ActiveRecord/Migration/CommandRecorder.html