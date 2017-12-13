This cop checks for .times.map calls.
In most cases such calls can be replaced
with an explicit array creation.

### Example:
    # bad
    9.times.map do |i|
      i.to_s
    end

    # good
    Array.new(9) do |i|
      i.to_s
    end