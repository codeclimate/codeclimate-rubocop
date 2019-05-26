This cop converts usages of `try!` to `&.`. It can also be configured
to convert `try`. It will convert code to use safe navigation.

### Example:
    # ConvertTry: false
      # bad
      foo.try!(:bar)
      foo.try!(:bar, baz)
      foo.try!(:bar) { |e| e.baz }

      foo.try!(:[], 0)

      # good
      foo.try(:bar)
      foo.try(:bar, baz)
      foo.try(:bar) { |e| e.baz }

      foo&.bar
      foo&.bar(baz)
      foo&.bar { |e| e.baz }


    # ConvertTry: true
      # bad
      foo.try!(:bar)
      foo.try!(:bar, baz)
      foo.try!(:bar) { |e| e.baz }
      foo.try(:bar)
      foo.try(:bar, baz)
      foo.try(:bar) { |e| e.baz }

      # good
      foo&.bar
      foo&.bar(baz)
      foo&.bar { |e| e.baz }