Checks the spacing inside and after block parameters pipes. Line breaks
inside parameter pipes are checked by `Layout/MultilineBlockLayout` and
not by this cop.

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