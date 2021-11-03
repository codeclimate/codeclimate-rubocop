This cop detects use of an excessive amount of numbered parameters in a
single block. Having too many numbered parameters can make code too
cryptic and hard to read.

The cop defaults to registering an offense if there is more than 1 numbered
parameter but this maximum can be configured by setting `Max`.

### Example: Max: 1 (default)
    # bad
    foo { _1.call(_2, _3, _4) }

    # good
    foo { do_something(_1) }