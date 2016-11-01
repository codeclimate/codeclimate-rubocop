This cop identifies places where `sort { |a, b| a.foo <=> b.foo }`
can be replaced by `sort_by(&:foo)`.

### Example:
    # bad
    array.sort { |a, b| a.foo <=> b.foo }

    # good
    array.sort_by(&:foo)
    array.sort_by { |v| v.foo }
    array.sort_by do |var|
      var.foo
    end