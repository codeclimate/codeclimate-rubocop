Detects use of an excessive amount of numbered parameters in a
single block. Having too many numbered parameters can make code too
cryptic and hard to read.

The cop defaults to registering an offense if there is more than 1 numbered
parameter but this maximum can be configured by setting `Max`.

### Example: Max: 1 (default)
    # bad
    use_multiple_numbered_parameters { _1.call(_2, _3, _4) }

    # good
    array.each { use_array_element_as_numbered_parameter(_1) }
    hash.each { use_only_hash_value_as_numbered_parameter(_2) }