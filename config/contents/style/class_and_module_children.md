Checks the style of children definitions at classes and
modules. Basically there are two different styles:

### Safety:

Autocorrection is unsafe.

Moving from compact to nested children requires knowledge of whether the
outer parent is a module or a class. Moving from nested to compact requires
verification that the outer parent is defined elsewhere. Rubocop does not
have the knowledge to perform either operation safely and thus requires
manual oversight.

### Example: EnforcedStyle: nested (default)
    # good
    # have each child on its own line
    class Foo
      class Bar
      end
    end

### Example: EnforcedStyle: compact
    # good
    # combine definitions as much as possible
    class Foo::Bar
    end

The compact style is only forced for classes/modules with one child.