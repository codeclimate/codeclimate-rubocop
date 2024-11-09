Flags uses of `OpenStruct`, as it is now officially discouraged
to be used for performance, version compatibility, and potential security issues.

### Safety:

Note that this cop may flag false positives; for instance, the following legal
use of a hand-rolled `OpenStruct` type would be considered an offense:

[source,ruby]
-----
module MyNamespace
  class OpenStruct # not the OpenStruct we're looking for
  end

  def new_struct
    OpenStruct.new # resolves to MyNamespace::OpenStruct
  end
end
-----

### Example:

    # bad
    point = OpenStruct.new(x: 0, y: 1)

    # good
    Point = Struct.new(:x, :y)
    point = Point.new(0, 1)

    # also good
    point = { x: 0, y: 1 }

    # bad
    test_double = OpenStruct.new(a: 'b')

    # good (assumes test using rspec-mocks)
    test_double = double
    allow(test_double).to receive(:a).and_return('b')
