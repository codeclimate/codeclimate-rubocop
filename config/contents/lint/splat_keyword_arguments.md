
This cop emulates the following Ruby warnings in Ruby 2.6.

% ruby -we "def m(a) end; h = {foo: 1}; m(**h)"
-e:1: warning: passing splat keyword arguments as a single Hash to `m'

It checks for use of splat keyword arguments as a single Hash.

### Example:
    # bad
    do_something(**arguments)

    # good
    do_something(arguments)
