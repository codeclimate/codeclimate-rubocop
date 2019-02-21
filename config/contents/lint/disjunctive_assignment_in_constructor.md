This cop checks constructors for disjunctive assignments that should
be plain assignments.

So far, this cop is only concerned with disjunctive assignment of
instance variables.

In ruby, an instance variable is nil until a value is assigned, so the
disjunction is unnecessary. A plain assignment has the same effect.

### Example:
    # bad
    def initialize
      @x ||= 1
    end

    # good
    def initialize
      @x = 1
    end