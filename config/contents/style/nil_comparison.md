This cop checks for comparison of something with nil using ==.

### Example:

    # bad
    if x == nil
    end

    # good
    if x.nil?
    end