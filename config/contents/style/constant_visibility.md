Checks that constants defined in classes and modules have
an explicit visibility declaration. By default, Ruby makes all class-
and module constants public, which litters the public API of the
class or module. Explicitly declaring a visibility makes intent more
clear, and prevents outside actors from touching private state.

### Example:

    # bad
    class Foo
      BAR = 42
      BAZ = 43
    end

    # good
    class Foo
      BAR = 42
      private_constant :BAR

      BAZ = 43
      public_constant :BAZ
    end

### Example: IgnoreModules: false (default)
    # bad
    class Foo
      MyClass = Struct.new()
    end

    # good
    class Foo
      MyClass = Struct.new()
      public_constant :MyClass
    end

### Example: IgnoreModules: true
    # good
    class Foo
      MyClass = Struct.new()
    end
