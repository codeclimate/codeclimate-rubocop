This cop checks for inheritance from Struct.new.

### Example:
    # bad
    class Person < Struct.new(:first_name, :last_name)
      def age
        42
      end
    end

    # good
    Person = Struct.new(:first_name, :last_name) do
      def age
        42
      end
    end