Checks for constant reassignments.

Emulates Ruby's runtime warning "already initialized constant X"
when a constant is reassigned in the same file and namespace using the
`NAME = value` syntax.

The cop cannot catch all offenses, like, for example, when a constant
is reassigned in another file, or when using metaprogramming (`Module#const_set`).

The cop only takes into account constants assigned in a "simple" way: directly
inside class/module definition, or within another constant. Other type of assignments
(e.g., inside a conditional) are disregarded.

The cop also tracks constant removal using `Module#remove_const` with symbol
or string argument.

### Example:
    # bad
    X = :foo
    X = :bar

    # bad
    class A
      X = :foo
      X = :bar
    end

    # bad
    module A
      X = :foo
      X = :bar
    end

    # good - keep only one assignment
    X = :bar

    class A
      X = :bar
    end

    module A
      X = :bar
    end

    # good - use OR assignment
    X = :foo
    X ||= :bar

    # good - use conditional assignment
    X = :foo
    X = :bar unless defined?(X)

    # good - remove the assigned constant first
    class A
      X = :foo
      remove_const :X
      X = :bar
    end
