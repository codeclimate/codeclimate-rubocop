This cop checks for setter call to local variable as the final
expression of a function definition.

### Example:

 def something
     x = Something.new
     x.attr = 5
 end