This cop checks that jobs subclass ApplicationJob with Rails 5.0.

### Example:

 # good
 class Rails5Job < ApplicationJob
     ...
 end

 # bad
 class Rails4Job < ActiveJob::Base
     ...
 end