This cop checks for debug calls (such as `debugger` or `binding.pry`) that should
not be kept for production code.

The cop can be configured using `DebuggerMethods`. By default, a number of gems
debug entrypoints are configured (`Kernel`, `Byebug`, `Capybara`, `debug.rb`,
`Pry`, `Rails`, `RubyJard`, and `WebConsole`). Additional methods can be added.

Specific default groups can be disabled if necessary:

[source,yaml]
----
Lint/Debugger:
    WebConsole: ~
----


### Example:

    # bad (ok during development)

    # using pry
    def some_method
      binding.pry
      do_something
    end

### Example:

    # bad (ok during development)

    # using byebug
    def some_method
      byebug
      do_something
    end

### Example:

    # good

    def some_method
      do_something
    end

### Example: DebuggerMethods: [my_debugger]

    # bad (ok during development)

    def some_method
      my_debugger
    end