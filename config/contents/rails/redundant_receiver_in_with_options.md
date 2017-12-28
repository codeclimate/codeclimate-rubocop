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

### Example:
    # bad
    with_options options: false do |merger|
      merger.invoke(merger.something)
    end

    # good
    with_options options: false do
      invoke(something)
    end

    # good
    client = Client.new
    with_options options: false do |merger|
      client.invoke(merger.something, something)
    end

    # ok
    # When `with_options` includes a block, all scoping scenarios
    # cannot be evaluated. Thus, it is ok to include the explicit
    # receiver.
    with_options options: false do |merger|
      merger.invoke
      with_another_method do |another_receiver|
        merger.invoke(another_receiver)
      end
    end