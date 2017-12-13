Checks the spacing inside and after block parameters pipes.

### Example: EnforcedStyleInsidePipes: no_space (default)
    # bad
    {}.each { | x,  y |puts x }
    ->( x,  y ) { puts x }

    # good
    {}.each { |x, y| puts x }
    ->(x, y) { puts x }

### Example: EnforcedStyleInsidePipes: space
    # bad
    {}.each { |x,  y| puts x }
    ->(x,  y) { puts x }

    # good
    {}.each { | x, y | puts x }
    ->( x, y ) { puts x }