This cop checks for non-nil checks, which are usually redundant.

### Example:

 # bad
 if x != nil

 # good (when not allowing semantic changes)
 # bad (when allowing semantic changes)
 if !x.nil?

 # good (when allowing semantic changes)
 if x

Non-nil checks are allowed if they are the final nodes of predicate.

 # good
 def signed_in?
     !current_user.nil?
 end