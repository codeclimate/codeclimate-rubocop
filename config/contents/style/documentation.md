This cop checks for missing top-level documentation of
classes and modules. Classes with no body are exempt from the
check and so are namespace modules - modules that have nothing in
their bodies except classes, other modules, or constant definitions.

The documentation requirement is annulled if the class or module has
a "#:nodoc:" comment next to it. Likewise, "#:nodoc: all" does the
same for all its children.

### Example:
    # bad
    class Person
      # ...
    end

    # good
    # Description/Explanation of Person class
    class Person
      # ...
    end
