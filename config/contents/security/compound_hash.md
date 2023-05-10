Checks for implementations of the `hash` method which combine
values using custom logic instead of delegating to `Array#hash`.

Manually combining hashes is error prone and hard to follow, especially
when there are many values. Poor implementations may also introduce
performance or security concerns if they are prone to collisions.
Delegating to `Array#hash` is clearer and safer, although it might be slower
depending on the use case.

### Safety:

This cop may be unsafe if the application logic depends on the hash
value, however this is inadvisable anyway.

### Example:

    # bad
    def hash
      @foo ^ @bar
    end

    # good
    def hash
      [@foo, @bar].hash
    end