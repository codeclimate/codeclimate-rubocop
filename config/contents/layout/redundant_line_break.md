Checks whether certain expressions, e.g. method calls, that could fit
completely on a single line, are broken up into multiple lines unnecessarily.

### Example:
    # bad
    foo(
      a,
      b
    )

    # good
    foo(a, b)

    # bad
    puts 'string that fits on ' \
         'a single line'

    # good
    puts 'string that fits on a single line'

    # bad
    things
      .select { |thing| thing.cond? }
      .join('-')

    # good
    things.select { |thing| thing.cond? }.join('-')

### Example: InspectBlocks: false (default)
    # good
    foo(a) do |x|
      puts x
    end

### Example: InspectBlocks: true
    # bad
    foo(a) do |x|
      puts x
    end

    # good
    foo(a) { |x| puts x }
