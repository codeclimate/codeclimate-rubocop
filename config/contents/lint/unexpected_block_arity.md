Checks for a block that is known to need more positional
block arguments than are given (by default this is configured for
`Enumerable` methods needing 2 arguments). Optional arguments are allowed,
although they don't generally make sense as the default value will
be used. Blocks that have no receiver, or take splatted arguments
(ie. `*args`) are always accepted.

Keyword arguments (including `**kwargs`) do not get counted towards
this, as they are not used by the methods in question.

Method names and their expected arity can be configured like this:

```yaml
Methods:
  inject: 2
  reduce: 2
```

### Safety:

 This cop matches for method names only and hence cannot tell apart
 methods with same name in different classes, which may lead to a
 false positive.

### Example:
    # bad
    values.reduce {}
    values.min { |a| a }
    values.sort { |a; b| a + b }

    # good
    values.reduce { |memo, obj| memo << obj }
    values.min { |a, b| a <=> b }
    values.sort { |*x| x[0] <=> x[1] }
