This cop looks for `has_many` or `has_one` associations that don't
specify a `:dependent` option.
It doesn't register an offense if `:through` option was specified.

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
      has_many :patients, through: :appointments
    end