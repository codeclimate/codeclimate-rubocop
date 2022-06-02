(by default) checks for uses of the lambda literal syntax for
single line lambdas, and the method call syntax for multiline lambdas.
It is configurable to enforce one of the styles for both single line
and multiline lambdas as well.

### Example: EnforcedStyle: line_count_dependent (default)
    # bad
    f = lambda { |x| x }
    f = ->(x) do
          x
        end

    # good
    f = ->(x) { x }
    f = lambda do |x|
          x
        end

### Example: EnforcedStyle: lambda
    # bad
    f = ->(x) { x }
    f = ->(x) do
          x
        end

    # good
    f = lambda { |x| x }
    f = lambda do |x|
          x
        end

### Example: EnforcedStyle: literal
    # bad
    f = lambda { |x| x }
    f = lambda do |x|
          x
        end

    # good
    f = ->(x) { x }
    f = ->(x) do
          x
        end