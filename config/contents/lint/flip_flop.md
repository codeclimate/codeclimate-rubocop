Looks for uses of flip-flop operator
based on the Ruby Style Guide.

Here is the history of flip-flops in Ruby.
flip-flop operator is deprecated in Ruby 2.6.0 and
the deprecation has been reverted by Ruby 2.7.0 and
backported to Ruby 2.6.
See: https://bugs.ruby-lang.org/issues/5400

### Example:
    # bad
    (1..20).each do |x|
      puts x if (x == 5) .. (x == 10)
    end

    # good
    (1..20).each do |x|
      puts x if (x >= 5) && (x <= 10)
    end