Enforces that optional keyword parameters are placed at the
end of the parameters list.

This improves readability, because when looking through the source,
it is expected to find required parameters at the beginning of parameters list
and optional parameters at the end.

### Example:
    # bad
    def some_method(first: false, second:, third: 10)
      # body omitted
    end

    # good
    def some_method(second:, first: false, third: 10)
      # body omitted
    end

    # bad
    do_something do |first: false, second:, third: 10|
      # body omitted
    end

    # good
    do_something do |second:, first: false, third: 10|
      # body omitted
    end
