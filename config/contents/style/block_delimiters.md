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

    # The AllowBracesOnProceduralOneLiners option is ignored unless the
    # EnforcedStyle is set to `semantic`. If so:

    # If the AllowBracesOnProceduralOneLiners option is unspecified, or
    # set to `false` or any other falsey value, then semantic purity is
    # maintained, so one-line procedural blocks must use do-end, not
    # braces.

    # bad
    collection.each { |element| puts element }

    # good
    collection.each do |element| puts element end

    # If the AllowBracesOnProceduralOneLiners option is set to `true`, or
    # any other truthy value, then one-line procedural blocks may use
    # either style. (There is no setting for requiring braces on them.)

    # good
    collection.each { |element| puts element }

    # also good
    collection.each do |element| puts element end

### Example: EnforcedStyle: braces_for_chaining
    # bad
    words.each do |word|
      word.flip.flop
    end.join("-")

    # good
    words.each { |word|
      word.flip.flop
    }.join("-")

### Example: EnforcedStyle: always_braces
    # bad
    words.each do |word|
      word.flip.flop
    end

    # good
    words.each { |word|
      word.flip.flop
    }

### Example: BracesRequiredMethods: ['sig']

    # Methods listed in the BracesRequiredMethods list, such as 'sig'
    # in this example, will require `{...}` braces. This option takes
    # precedence over all other configurations except IgnoredMethods.

    # bad
    sig do
      params(
        foo: string,
      ).void
    end
    def bar(foo)
      puts foo
    end

    # good
    sig {
      params(
        foo: string,
      ).void
    }
    def bar(foo)
      puts foo
    end
