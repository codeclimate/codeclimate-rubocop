This cop checks for use of the lambda.(args) syntax.

### Example:

 # bad
 lambda.(x, y)

 # good
 lambda.call(x, y)