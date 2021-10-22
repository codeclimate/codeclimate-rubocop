This cop checks for the use of local variable names from an outer scope
in block arguments or block-local variables. This mirrors the warning
given by `ruby -cw` prior to Ruby 2.6:
"shadowing outer local variable - foo".

NOTE: Shadowing of variables in block passed to `Ractor.new` is allowed
because `Ractor` should not access outer variables.
eg. following style is encouraged:

    worker_id, pipe = env
    Ractor.new(worker_id, pipe) do |worker_id, pipe|
    end

### Example:

    # bad

    def some_method
      foo = 1

      2.times do |foo| # shadowing outer `foo`
        do_something(foo)
      end
    end

### Example:

    # good

    def some_method
      foo = 1

      2.times do |bar|
        do_something(bar)
      end
    end