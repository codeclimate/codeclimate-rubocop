This cop checks for places where multiple consecutive loops over the same data
can be combined into a single loop. It is very likely that combining them
will make the code more efficient and more concise.

It is marked as unsafe, because the first loop might modify
a state that the second loop depends on; these two aren't combinable.

### Example:
    # bad
    def method
      items.each do |item|
        do_something(item)
      end

      items.each do |item|
        do_something_else(item)
      end
    end

    # good
    def method
      items.each do |item|
        do_something(item)
        do_something_else(item)
      end
    end

    # bad
    def method
      for item in items do
        do_something(item)
      end

      for item in items do
        do_something_else(item)
      end
    end

    # good
    def method
      for item in items do
        do_something(item)
        do_something_else(item)
      end
    end

    # good
    def method
      each_slice(2) { |slice| do_something(slice) }
      each_slice(3) { |slice| do_something(slice) }
    end
