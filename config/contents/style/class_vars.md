This cop checks for uses of class variables. Offenses
are signaled only on assignment to class variables to
reduce the number of offenses that would be reported.

You have to be careful when setting a value for a class
variable; if a class has been inherited, changing the
value of a class variable also affects the inheriting
classes. This means that it's almost always better to
use a class instance variable instead.

### Example:
    # bad
    class A
      @@test = 10
    end

    # good
    class A
      @test = 10
    end

    class A
      def test
        @@test # you can access class variable without offense
      end
    end
