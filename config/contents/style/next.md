Use `next` to skip iteration instead of a condition at the end.

### Example:
    # bad
    [1, 2].each do |a|
      if a == 1
        puts a
      end
    end

    # good
    [1, 2].each do |a|
      next unless a == 1
      puts a
    end