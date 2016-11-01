This cop checks the style of children definitions at classes and
modules. Basically there are two different styles:

nested - have each child on its own line
    class Foo
      class Bar
      end
    end

compact - combine definitions as much as possible
    class Foo::Bar
    end

The compact style is only forced for classes/modules with one child.