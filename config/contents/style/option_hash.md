Checks for options hashes and discourages them if the
current Ruby version supports keyword arguments.

### Example:

    # bad
    def fry(options = {})
      temperature = options.fetch(:temperature, 300)
      # ...
    end


    # good
    def fry(temperature: 300)
      # ...
    end