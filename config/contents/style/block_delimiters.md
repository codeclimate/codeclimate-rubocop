Check for uses of braces or do/end around single line or
multi-line blocks.

### Example: EnforcedStyle: line_count_based (default)
    # bad - single line block
    items.each do |item| item / 5 end

    # good - single line block
    items.each { |item| item / 5 }

    # bad - multi-line block
    things.map { |thing|
      something = thing.some_method
      process(something)
    }

    # good - multi-line block
    things.map do |thing|
      something = thing.some_method
      process(something)
    end

### Example: EnforcedStyle: semantic
    # Prefer `do...end` over `{...}` for procedural blocks.

    # return value is used/assigned
    # bad
    foo = map do |x|
      x
    end
    puts (map do |x|
      x
    end)

    # return value is not used out of scope
    # good
    map do |x|
      x
    end

    # Prefer `{...}` over `do...end` for functional blocks.

    # return value is not used out of scope
    # bad
    each { |x|
      x
    }

    # return value is used/assigned
    # good
    foo = map { |x|
      x
    }
    map { |x|
      x
    }.inspect

### Example: EnforcedStyle: braces_for_chaining
    # bad
    words.each do |word|
      word.flip.flop
    end.join("-")

    # good
    words.each { |word|
      word.flip.flop
    }.join("-")
