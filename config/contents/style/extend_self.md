This cop checks that `#module_function` is used over `extend self`.

### Example: EnforcedStyle: module_function (default)

    # bad
    module Foo
      extend self
    end

    # good
    module Foo
      module_function
    end

### Example: EnforcedStyle: extend_self

    # bad
    module Foo
      module_function
    end

    # good
    module Foo
      extend self
    end