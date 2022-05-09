This cop suggests `ENV.fetch` for the replacement of `ENV[]`.
`ENV[]` silently fails and returns `nil` when the environment variable is unset,
which may cause unexpected behaviors when the developer forgets to set it.
On the other hand, `ENV.fetch` raises KeyError or returns the explicitly
specified default value.

When an `ENV[]` is the LHS of `||`, the autocorrect makes the RHS
the default value of `ENV.fetch`.

### Example:
    # bad
    ENV['X']
    ENV['X'] || 'string literal'
    ENV['X'] || some_method
    x = ENV['X']

    ENV['X'] || y.map do |a|
      puts a * 2
    end

    # good
    ENV.fetch('X')
    ENV.fetch('X', 'string literal')
    ENV.fetch('X') { some_method }
    x = ENV.fetch('X')

    ENV.fetch('X') do
      y.map do |a|
        puts a * 2
      end
    end

    # also good
    !ENV['X']
    ENV['X'].some_method # (e.g. `.nil?`)
