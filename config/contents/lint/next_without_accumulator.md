Don't omit the accumulator when calling `next` in a `reduce` block.

### Example:

    # bad

    result = (1..4).reduce(0) do |acc, i|
      next if i.odd?
      acc + i
    end

### Example:

    # good

    result = (1..4).reduce(0) do |acc, i|
      next acc if i.odd?
      acc + i
    end