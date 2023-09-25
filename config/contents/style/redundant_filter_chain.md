Identifies usages of `any?`, `empty?` or `none?` predicate methods
chained to `select`/`filter`/`find_all` and change them to use predicate method instead.

### Example:
    # bad
    arr.select { |x| x > 1 }.any?

    # good
    arr.any? { |x| x > 1 }

    # bad
    arr.select { |x| x > 1 }.empty?
    arr.select { |x| x > 1 }.none?

    # good
    arr.none? { |x| x > 1 }

    # good
    relation.select(:name).any?
    arr.select { |x| x > 1 }.any?(&:odd?)

### Example: AllCops:ActiveSupportExtensionsEnabled: false (default)
    # good
    arr.select { |x| x > 1 }.many?

### Example: AllCops:ActiveSupportExtensionsEnabled: true
    # bad
    arr.select { |x| x > 1 }.many?

    # good
    arr.many? { |x| x > 1 }
