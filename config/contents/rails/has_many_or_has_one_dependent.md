This cop looks for `has_many` or `has_one` associations that don't
specify a `:dependent` option.

### Example:
    # bad
    class User < ActiveRecord::Base
      has_many :comments
      has_one :avatar
    end

    # good
    class User < ActiveRecord::Base
      has_many :comments, dependent: :restrict_with_exception
      has_one :avatar, dependent: :destroy
    end