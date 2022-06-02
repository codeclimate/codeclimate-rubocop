Checks for trailing code after the module definition.

### Example:
    # bad
    module Foo extend self
    end

    # good
    module Foo
      extend self
    end
