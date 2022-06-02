Checks for redundant `with_object`.

### Example:
    # bad
    ary.each_with_object([]) do |v|
      v
    end

    # good
    ary.each do |v|
      v
    end

    # bad
    ary.each.with_object([]) do |v|
      v
    end

    # good
    ary.each do |v|
      v
    end
