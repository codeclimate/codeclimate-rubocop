Checks whether certain expressions, e.g. method calls, that could fit
completely on a single line, are broken up into multiple lines unnecessarily.

### Example: any configuration
    # bad
    foo(
      a,
      b
    )

    puts 'string that fits on ' \
         'a single line'

    things
      .select { |thing| thing.cond? }
      .join('-')

    # good
    foo(a, b)

    puts 'string that fits on a single line'

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
