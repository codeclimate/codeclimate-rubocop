This cop checks for the use of local variable names from an outer scope
in block arguments or block-local variables. This mirrors the warning
given by `ruby -cw` prior to Ruby 2.6:
"shadowing outer local variable - foo".

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