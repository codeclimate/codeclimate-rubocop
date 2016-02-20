This cop checks for options hashes and discourages them if the
current Ruby version supports keyword arguments.

### Example:
    Instead of:

    def fry(options = {})
      temperature = options.fetch(:temperature, 300)
      ...
    end

    Prefer:

    def fry(temperature: 300)
      ...
    end