Checks that a range literal is enclosed in parentheses when the end of the range is
at a line break.

NOTE: The following is maybe intended for `(42..)`. But, compatible is `42..do_something`.
So, this cop does not provide autocorrection because it is left to user.

```ruby
case condition
when 42..
  do_something
end
```

### Example:

    # bad - Represents `(1..42)`, not endless range.
    1..
    42

    # good - It's incompatible, but your intentions when using endless range may be:
    (1..)
    42

    # good
    1..42

    # good
    (1..42)

    # good
    (1..
    42)
