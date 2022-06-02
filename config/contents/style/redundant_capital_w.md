Checks for usage of the %W() syntax when %w() would do.

### Example:
    # bad
    %W(cat dog pig)
    %W[door wall floor]

    # good
    %w/swim run bike/
    %w[shirt pants shoes]
    %W(apple #{fruit} grape)