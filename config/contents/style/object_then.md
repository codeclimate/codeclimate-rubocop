Enforces the use of consistent method names
`Object#yield_self` or `Object#then`.

### Example: EnforcedStyle: then (default)

    # bad
    obj.yield_self { |x| x.do_something }

    # good
    obj.then { |x| x.do_something }

### Example: EnforcedStyle: yield_self

    # bad
    obj.then { |x| x.do_something }

    # good
    obj.yield_self { |x| x.do_something }
