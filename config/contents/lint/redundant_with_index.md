Checks for redundant `with_index`.

### Example:
    # bad
    ary.each_with_index do |v|
      v
    end

    # good
    ary.each do |v|
      v
    end

    # bad
    ary.each.with_index do |v|
      v
    end

    # good
    ary.each do |v|
      v
    end
