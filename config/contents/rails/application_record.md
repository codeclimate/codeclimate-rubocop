This cop checks that models subclass ApplicationRecord with Rails 5.0.

### Example:

 # good
 class Rails5Model < ApplicationRecord
     ...
 end

 # bad
 class Rails4Model < ActiveRecord::Base
     ...
 end