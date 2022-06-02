Checks for underscore-prefixed variables that are actually
used.

Since block keyword arguments cannot be arbitrarily named at call
sites, the `AllowKeywordBlockArguments` will allow use of underscore-
prefixed block keyword arguments.

### Example: AllowKeywordBlockArguments: false (default)

    # bad

    [1, 2, 3].each do |_num|
      do_something(_num)
    end

    query(:sales) do |_id:, revenue:, cost:|
      {_id: _id, profit: revenue - cost}
    end

    # good

    [1, 2, 3].each do |num|
      do_something(num)
    end

    [1, 2, 3].each do |_num|
      do_something # not using `_num`
    end

### Example: AllowKeywordBlockArguments: true

    # good

    query(:sales) do |_id:, revenue:, cost:|
      {_id: _id, profit: revenue - cost}
    end
