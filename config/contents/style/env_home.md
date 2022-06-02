Checks for consistent usage of `ENV['HOME']`. If `nil` is used as
the second argument of `ENV.fetch`, it is treated as a bad case like `ENV[]`.

### Safety:

The cop is unsafe because the result when `nil` is assigned to `ENV['HOME']` changes:

```ruby
ENV['HOME'] = nil
ENV['HOME'] # => nil
Dir.home    # => '/home/foo'
```

### Example:

    # bad
    ENV['HOME']
    ENV.fetch('HOME', nil)

    # good
    Dir.home

    # good
    ENV.fetch('HOME', default)
