Checks for debug calls (such as `debugger` or `binding.pry`) that should
not be kept for production code.

The cop can be configured using `DebuggerMethods`. By default, a number of gems
debug entrypoints are configured (`Kernel`, `Byebug`, `Capybara`, `debug.rb`,
`Pry`, `Rails`, `RubyJard`, and `WebConsole`). Additional methods can be added.

Specific default groups can be disabled if necessary:

```yaml
Lint/Debugger:
  DebuggerMethods:
    WebConsole: ~
```

You can also add your own methods by adding a new category:

```yaml
Lint/Debugger:
  DebuggerMethods:
    MyDebugger:
      MyDebugger.debug_this
```

Some gems also ship files that will start a debugging session when required,
for example `require 'debug/start'` from `ruby/debug`. These requires can
be configured through `DebuggerRequires`. It has the same structure as
`DebuggerMethods`, which you can read about above.

### Example:

    # bad (ok during development)

    # using pry
    def some_method
      binding.pry
      do_something
    end

    # bad (ok during development)

    # using byebug
    def some_method
      byebug
      do_something
    end

    # good

    def some_method
      do_something
    end

### Example: DebuggerMethods: [my_debugger]

    # bad (ok during development)

    def some_method
      my_debugger
    end

### Example: DebuggerRequires: [my_debugger/start]

    # bad (ok during development)

    require 'my_debugger/start'