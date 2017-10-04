This cop checks whether constant value isn't relative date.
Because the relative date will be evaluated only once.

### Example:
    # bad
    class SomeClass
      EXPIRED_AT = 1.week.since
    end

    # good
    class SomeClass
      def self.expired_at
        1.week.since
      end
    end