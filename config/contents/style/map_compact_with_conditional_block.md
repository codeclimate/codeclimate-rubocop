Prefer `select` or `reject` over `map { ... }.compact`.
This cop also handles `filter_map { ... }`, similar to `map { ... }.compact`.

### Example:

    # bad
    array.map { |e| some_condition? ? e : next }.compact

    # bad
    array.filter_map { |e| some_condition? ? e : next }

    # bad
    array.map do |e|
      if some_condition?
        e
      else
        next
      end
    end.compact

    # bad
    array.map do |e|
      next if some_condition?

      e
    end.compact

    # bad
    array.map do |e|
      e if some_condition?
    end.compact

    # good
    array.select { |e| some_condition? }

    # good
    array.reject { |e| some_condition? }
