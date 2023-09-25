Enforces empty line after guard clause.

This cop allows `# :nocov:` directive after guard clause because
SimpleCov excludes code from the coverage report by wrapping it in `# :nocov:`:

```ruby
def foo
  # :nocov:
  return if condition
  # :nocov:
  bar
end
```

Refer to SimpleCov's documentation for more details:
https://github.com/simplecov-ruby/simplecov#ignoringskipping-code

### Example:

    # bad
    def foo
      return if need_return?
      bar
    end

    # good
    def foo
      return if need_return?

      bar
    end

    # good
    def foo
      return if something?
      return if something_different?

      bar
    end

    # also good
    def foo
      if something?
        do_something
        return if need_return?
      end
    end