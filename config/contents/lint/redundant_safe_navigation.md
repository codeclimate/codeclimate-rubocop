This cop checks for redundant safe navigation calls.
`instance_of?`, `kind_of?`, `is_a?`, `eql?`, `respond_to?`, and `equal?` methods
are checked by default. These are customizable with `AllowedMethods` option.

In the example below, the safe navigation operator (`&.`) is unnecessary
because `NilClass` has methods like `respond_to?` and `is_a?`.

### Safety:

This cop is unsafe, because auto-correction can change the return type of
the expression. An offending expression that previously could return `nil`
will be auto-corrected to never return `nil`.

### Example:
    # bad
    do_something if attrs&.respond_to?(:[])

    # good
    do_something if attrs.respond_to?(:[])

    # bad
    while node&.is_a?(BeginNode)
      node = node.parent
    end

    # good
    while node.is_a?(BeginNode)
      node = node.parent
    end

    # good - without `&.` this will always return `true`
    foo&.respond_to?(:to_a)
