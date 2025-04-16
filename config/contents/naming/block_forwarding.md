In Ruby 3.1, anonymous block forwarding has been added.

This cop identifies places where `do_something(&block)` can be replaced
by `do_something(&)`.

It also supports the opposite style by alternative `explicit` option.
You can specify the block variable name for autocorrection with `BlockForwardingName`.
The default variable name is `block`. If the name is already in use, it will not be
autocorrected.

[NOTE]
====
Because of a bug in Ruby 3.3.0, when a block is referenced inside of another block,
no offense will be registered until Ruby 3.4:

```ruby
def foo(&block)
  # Using an anonymous block would be a syntax error on Ruby 3.3.0
  block_method { bar(&block) }
end
```
====

### Example: EnforcedStyle: anonymous (default)

    # bad
    def foo(&block)
      bar(&block)
    end

    # good
    def foo(&)
      bar(&)
    end

### Example: EnforcedStyle: explicit

    # bad
    def foo(&)
      bar(&)
    end

    # good
    def foo(&block)
      bar(&block)
    end
