Checks for a line break before the first element in a
multi-line array.

### Example: AllowMultilineFinalElement: false (default)

      # bad
      [ :a,
        :b]

      # bad
      [ :a, {
        :b => :c
      }]

      # good
      [:a, :b]

      # good
      [
        :a,
        :b]

      # good
      [
        :a, {
        :b => :c
      }]

### Example: AllowMultilineFinalElement: true

      # bad
      [ :a,
        :b]

      # good
      [ :a, {
        :b => :c
      }]

      # good
      [
        :a,
        :b]

      # good
      [:a, :b]