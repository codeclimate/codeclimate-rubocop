This cop looks for uses of flip-flop operator.
flip-flop operator is deprecated since Ruby 2.6.0.

### Example:
    # bad
    (1..20).each do |x|
      puts x if (x == 5) .. (x == 10)
    end

    # good
    (1..20).each do |x|
      puts x if (x >= 5) && (x <= 10)
    end