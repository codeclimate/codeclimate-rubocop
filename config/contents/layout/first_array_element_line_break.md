Checks for a line break before the first element in a
multi-line array.

### Example:

    # bad
    [ :a,
      :b]

    # good
    [
      :a,
      :b]

    # good
    [:a, :b]

### Example: AllowMultilineFinalElement: false (default)

    # bad
    [ :a, {
      :b => :c
    }]

    # good
    [
      :a, {
      :b => :c
    }]

### Example: AllowMultilineFinalElement: true

    # good
    [:a, {
      :b => :c
    }]
