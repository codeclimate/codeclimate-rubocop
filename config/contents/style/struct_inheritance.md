This cop checks for inheritance from Struct.new.

### Example:
    # bad
    class Person < Struct.new(:first_name, :last_name)
    end

    # good
    Person = Struct.new(:first_name, :last_name)