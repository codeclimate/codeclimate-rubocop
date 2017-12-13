This cop checks for redundant receiver in `with_options`.
Receiver is implicit from Rails 4.2 or higher.

### Example:
    # bad
    class Account < ApplicationRecord
      with_options dependent: :destroy do |assoc|
        assoc.has_many :customers
        assoc.has_many :products
        assoc.has_many :invoices
        assoc.has_many :expenses
      end
    end

    # good
    class Account < ApplicationRecord
      with_options dependent: :destroy do
        has_many :customers
        has_many :products
        has_many :invoices
        has_many :expenses
      end
    end