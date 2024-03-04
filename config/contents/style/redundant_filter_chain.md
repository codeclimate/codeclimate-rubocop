Identifies usages of `any?`, `empty?` or `none?` predicate methods
chained to `select`/`filter`/`find_all` and change them to use predicate method instead.

### Safety:

This cop's autocorrection is unsafe because `array.select.any?` evaluates all elements
through the `select` method, while `array.any?` uses short-circuit evaluation.
In other words, `array.select.any?` guarantees the evaluation of every element,
but `array.any?` does not necessarily evaluate all of them.

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

    # good
    arr.select { |x| x > 1 }.present?

### Example: AllCops:ActiveSupportExtensionsEnabled: true
    # bad
    arr.select { |x| x > 1 }.many?

    # good
    arr.many? { |x| x > 1 }

    # bad
    arr.select { |x| x > 1 }.present?

    # good
    arr.any? { |x| x > 1 }
