Checks constructors for disjunctive assignments (`||=`) that should
be plain assignments.

So far, this cop is only concerned with disjunctive assignment of
instance variables.

In ruby, an instance variable is nil until a value is assigned, so the
disjunction is unnecessary. A plain assignment has the same effect.

### Safety:

This cop is unsafe because it can register a false positive when a
method is redefined in a subclass that calls super. For example:

```ruby
class Base
  def initialize
    @config ||= 'base'
  end
end

class Derived < Base
  def initialize
    @config = 'derived'
    super
  end
end
```

Without the disjunctive assignment, `Derived` will be unable to override
the value for `@config`.

### Example:
    # bad
    def initialize
      @x ||= 1
    end

    # good
    def initialize
      @x = 1
    end