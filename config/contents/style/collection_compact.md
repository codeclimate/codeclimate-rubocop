This cop checks for places where custom logic on rejection nils from arrays
and hashes can be replaced with `{Array,Hash}#{compact,compact!}`.

It is marked as unsafe by default because false positives may occur in the
nil check of block arguments to the receiver object.
For example, `[[1, 2], [3, nil]].reject { |first, second| second.nil? }`
and `[[1, 2], [3, nil]].compact` are not compatible. This will work fine
when the receiver is a hash object.

### Example:
    # bad
    array.reject { |e| e.nil? }
    array.select { |e| !e.nil? }

    # good
    array.compact

    # bad
    hash.reject! { |k, v| v.nil? }
    hash.select! { |k, v| !v.nil? }

    # good
    hash.compact!
