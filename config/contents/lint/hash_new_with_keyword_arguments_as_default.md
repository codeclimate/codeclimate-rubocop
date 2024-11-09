Checks for the deprecated use of keyword arguments as a default in `Hash.new`.

This usage raises a warning in Ruby 3.3 and results in an error in Ruby 3.4.
In Ruby 3.4, keyword arguments will instead be used to change the behavior of a hash.
For example, the capacity option can be passed to create a hash with a certain size
if you know it in advance, for better performance.

NOTE: The following corner case may result in a false negative when upgrading from Ruby 3.3
or earlier, but it is intentionally not detected to respect the expected usage in Ruby 3.4.

```ruby
Hash.new(capacity: 42)
```

### Example:

    # bad
    Hash.new(key: :value)

    # good
    Hash.new({key: :value})
