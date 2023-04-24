Checks for inheritance from `Data.define` to avoid creating the anonymous parent class.

### Safety:

Autocorrection is unsafe because it will change the inheritance
tree (e.g. return value of `Module#ancestors`) of the constant.

### Example:
    # bad
    class Person < Data.define(:first_name, :last_name)
      def age
        42
      end
    end

    # good
    Person = Data.define(:first_name, :last_name) do
      def age
        42
      end
    end