Looks for references of `Regexp` captures that are out of range
and thus always returns nil.

### Safety:

This cop is unsafe because it is naive in how it determines what
references are available based on the last encountered regexp, but
it cannot handle some cases, such as conditional regexp matches, which
leads to false positives, such as:

```ruby
foo ? /(c)(b)/ =~ str : /(b)/ =~ str
do_something if $2
# $2 is defined for the first condition but not the second, however
# the cop will mark this as an offense.
```

This might be a good indication of code that should be refactored,
however.

### Example:

    /(foo)bar/ =~ 'foobar'

    # bad - always returns nil

    puts $2 # => nil

    # good

    puts $1 # => foo
