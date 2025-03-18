Checks that namespaced classes and modules are defined with a consistent style.

With `nested` style, classes and modules should be defined separately (one constant
on each line, without `::`). With `compact` style, classes and modules should be
defined with fully qualified names (using `::` for namespaces).

NOTE: The style chosen will affect `Module.nesting` for the class or module. Using
`nested` style will result in each level being added, whereas `compact` style will
only include the fully qualified class or module name.

By default, `EnforcedStyle` applies to both classes and modules. If desired, separate
styles can be defined for classes and modules by using `EnforcedStyleForClasses` and
`EnforcedStyleForModules` respectively. If not set, or set to nil, the `EnforcedStyle`
value will be used.

### Safety:

Autocorrection is unsafe.

Moving from `compact` to `nested` children requires knowledge of whether the
outer parent is a module or a class. Moving from `nested` to `compact` requires
verification that the outer parent is defined elsewhere. RuboCop does not
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