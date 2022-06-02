Checks for use of the lambda.(args) syntax.

### Example: EnforcedStyle: call (default)
 # bad
 lambda.(x, y)

 # good
 lambda.call(x, y)

### Example: EnforcedStyle: braces
 # bad
 lambda.call(x, y)

 # good
 lambda.(x, y)