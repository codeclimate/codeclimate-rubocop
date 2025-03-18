Checks for redundant `if` with boolean literal branches.
It checks only conditions to return boolean value (`true` or `false`) for safe detection.
The conditions to be checked are comparison methods, predicate methods, and
double negation (!!).
`nonzero?` method is allowed by default.
These are customizable with `AllowedMethods` option.

This cop targets only `if`s with a single `elsif` or `else` branch. The following
code will be allowed, because it has two `elsif` branches:

```ruby
if foo
  true
elsif bar > baz
  true
elsif qux > quux # Single `elsif` is warned, but two or more `elsif`s are not.
  true
else
  false
end
```

### Safety:

Autocorrection is unsafe because there is no guarantee that all predicate methods
will return a boolean value. Those methods can be allowed with `AllowedMethods` config.

### Example:
    # bad
    if foo == bar
      true
    else
      false
    end

    # bad
    foo == bar ? true : false

    # good
    foo == bar

    # bad
    if foo.do_something?
      true
    else
      false
    end

    # good (but potentially an unsafe correction)
    foo.do_something?

### Example: AllowedMethods: ['nonzero?'] (default)
    # good
    num.nonzero? ? true : false
