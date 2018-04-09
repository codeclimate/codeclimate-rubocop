This cop checks for uses of class variables. Offenses
are signaled only on assignment to class variables to
reduce the number of offenses that would be reported.

Setting value for class variable need to take care.
If some class has been inherited by other classes, setting value
for class variable affected children classes.
So using class instance variable is better in almost case.

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
        @@test # you can access class variable without offence
      end
    end
