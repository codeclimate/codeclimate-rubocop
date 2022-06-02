Checks for a redundant argument passed to certain methods.

NOTE: This cop is limited to methods with single parameter.

Method names and their redundant arguments can be configured like this:

```yaml
Methods:
  join: ''
  split: ' '
  chomp: "\n"
  chomp!: "\n"
  foo: 2
```

### Safety:

This cop is unsafe because of the following limitations:

1. This cop matches by method names only and hence cannot tell apart
   methods with same name in different classes.
2. This cop may be unsafe if certain special global variables (e.g. `$;`, `$/`) are set.
   That depends on the nature of the target methods, of course. For example, the default
   argument to join is `$OUTPUT_FIELD_SEPARATOR` (or `$,`) rather than `''`, and if that
   global is changed, `''` is no longer a redundant argument.

### Example:
    # bad
    array.join('')
    [1, 2, 3].join("")
    string.split(" ")
    "first\nsecond".split(" ")
    string.chomp("\n")
    string.chomp!("\n")
    A.foo(2)

    # good
    array.join
    [1, 2, 3].join
    string.split
    "first second".split
    string.chomp
    string.chomp!
    A.foo