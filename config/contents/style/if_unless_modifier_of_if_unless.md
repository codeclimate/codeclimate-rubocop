Checks for if and unless statements used as modifiers of other if or
unless statements.

### Example:

 # bad
 tired? ? 'stop' : 'go faster' if running?

 # bad
 if tired?
     "please stop"
 else
     "keep going"
 end if running?

 # good
 if running?
     tired? ? 'stop' : 'go faster'
 end