This cop checks for `OpenStruct.new` calls.
Instantiation of an `OpenStruct` invalidates
Ruby global method cache as it causes dynamic method
definition during program runtime.
This could have an effect on performance,
especially in case of single-threaded
applications with multiple `OpenStruct` instantiations.

### Example:
    # bad
    class MyClass
      def my_method
        OpenStruct.new(my_key1: 'my_value1', my_key2: 'my_value2')
      end
    end

    # good
    class MyClass
      MyStruct = Struct.new(:my_key1, :my_key2)
      def my_method
        MyStruct.new('my_value1', 'my_value2')
      end
    end
