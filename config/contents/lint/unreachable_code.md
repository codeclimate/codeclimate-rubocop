This cop checks for code that will never run, because it follows a flow control
statement such as `return` or `raise`.

### Example:

    # bad
    def sad
      raise RuntimeError

      puts "This line will never be reached, so why even include it?"
    end

    # good
    def happy
      raise RuntimeError if problem?

      puts "This line of code will sometimes be reached"
    end
