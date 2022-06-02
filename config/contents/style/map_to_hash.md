Looks for uses of `map.to_h` or `collect.to_h` that could be
written with just `to_h` in Ruby >= 2.6.

NOTE: `Style/HashTransformKeys` and `Style/HashTransformValues` will
also change this pattern if only hash keys or hash values are being
transformed.

### Safety:

This cop is unsafe, as it can produce false positives if the receiver
is not an `Enumerable`.

### Example:
    # bad
    something.map { |v| [v, v * 2] }.to_h

    # good
    something.to_h { |v| [v, v * 2] }

    # bad
    {foo: bar}.collect { |k, v| [k.to_s, v.do_something] }.to_h

    # good
    {foo: bar}.to_h { |k, v| [k.to_s, v.do_something] }
