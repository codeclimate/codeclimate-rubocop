Looks for `reduce` or `inject` blocks where the value returned (implicitly or
explicitly) does not include the accumulator. A block is considered valid as
long as at least one return value includes the accumulator.

If the accumulator is not included in the return value, then the entire
block will just return a transformation of the last element value, and
could be rewritten as such without a loop.

Also catches instances where an index of the accumulator is returned, as
this may change the type of object being retained.

NOTE: For the purpose of reducing false positives, this cop only flags
returns in `reduce` blocks where the element is the only variable in
the expression (since we will not be able to tell what other variables
relate to via static analysis).

### Example:

    # bad
    (1..4).reduce(0) do |acc, el|
      el * 2
    end

    # bad, may raise a NoMethodError after the first iteration
    %w(a b c).reduce({}) do |acc, letter|
      acc[letter] = true
    end

    # good
    (1..4).reduce(0) do |acc, el|
      acc + el * 2
    end

    # good, element is returned but modified using the accumulator
    values.reduce do |acc, el|
      el << acc
      el
    end

    # good, returns the accumulator instead of the index
    %w(a b c).reduce({}) do |acc, letter|
      acc[letter] = true
      acc
    end

    # good, at least one branch returns the accumulator
    values.reduce(nil) do |result, value|
      break result if something?
      value
    end

    # good, recursive
    keys.reduce(self) { |result, key| result[key] }

    # ignored as the return value cannot be determined
    enum.reduce do |acc, el|
      x = foo(acc, el)
      bar(x)
    end