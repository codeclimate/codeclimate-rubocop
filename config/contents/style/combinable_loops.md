Checks for places where multiple consecutive loops over the same data
can be combined into a single loop. It is very likely that combining them
will make the code more efficient and more concise.

NOTE: Autocorrection is not applied when the block variable names differ in separate loops,
as it is impossible to determine which variable name should be prioritized.

### Safety:

The cop is unsafe, because the first loop might modify state that the
second loop depends on; these two aren't combinable.

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
