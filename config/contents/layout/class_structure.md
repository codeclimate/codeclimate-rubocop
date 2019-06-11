Checks if the code style follows the ExpectedOrder configuration:

`Categories` allows us to map macro names into a category.

Consider an example of code style that covers the following order:
- Constants
- Associations (has_one, has_many)
- Attributes (attr_accessor, attr_writer, attr_reader)
- Initializer
- Instance methods
- Protected methods
- Private methods

You can configure the following order:

```yaml
 Layout/ClassStructure:
     Categories:
       module_inclusion:
         - include
         - prepend
         - extend
     ExpectedOrder:
         - module_inclusion
         - constants
         - public_class_methods
         - initializer
         - public_methods
         - protected_methods
         - private_methods

```
Instead of putting all literals in the expected order, is also
possible to group categories of macros.

```yaml
 Layout/ClassStructure:
     Categories:
       association:
         - has_many
         - has_one
       attribute:
         - attr_accessor
         - attr_reader
         - attr_writer
```

### Example:
    # bad
    # Expect extend be before constant
    class Person < ApplicationRecord
      has_many :orders
      ANSWER = 42

      extend SomeModule
      include AnotherModule
    end

    # good
    class Person
      # extend and include go first
      extend SomeModule
      include AnotherModule

      # inner classes
      CustomError = Class.new(StandardError)

      # constants are next
      SOME_CONSTANT = 20

      # afterwards we have attribute macros
      attr_reader :name

      # followed by other macros (if any)
      validates :name

      # public class methods are next in line
      def self.some_method
      end

      # initialization goes between class methods and instance methods
      def initialize
      end

      # followed by other public instance methods
      def some_method
      end

      # protected and private methods are grouped near the end
      protected

      def some_protected_method
      end

      private

      def some_private_method
      end
    end

@see https://github.com/rubocop-hq/ruby-style-guide#consistent-classes