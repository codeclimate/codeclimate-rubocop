Use `next` to skip iteration instead of a condition at the end.

### Example: EnforcedStyle: skip_modifier_ifs (default)
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

    # good
    [1, 2].each do |o|
      puts o unless o == 1
    end

### Example: EnforcedStyle: always
    # With `always` all conditions at the end of an iteration needs to be
    # replaced by next - with `skip_modifier_ifs` the modifier if like
    # this one are ignored: `[1, 2].each { |a| return 'yes' if a == 1 }`

    # bad
    [1, 2].each do |o|
      puts o unless o == 1
    end

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