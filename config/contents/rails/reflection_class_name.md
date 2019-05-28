This cop checks if the value of the option `class_name`, in
the definition of a reflection is a string.

### Example:
    # bad
    has_many :accounts, class_name: Account
    has_many :accounts, class_name: Account.name

    # good
    has_many :accounts, class_name: 'Account'