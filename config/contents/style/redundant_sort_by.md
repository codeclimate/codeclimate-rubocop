Identifies places where `sort_by { ... }` can be replaced by
`sort`.

### Example:
    # bad
    array.sort_by { |x| x }
    array.sort_by do |var|
      var
    end

    # good
    array.sort