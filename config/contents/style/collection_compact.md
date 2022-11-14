Checks for places where custom logic on rejection nils from arrays
and hashes can be replaced with `{Array,Hash}#{compact,compact!}`.

### Safety:

It is unsafe by default because false positives may occur in the
`nil` check of block arguments to the receiver object. Additionally,
 we can't know the type of the receiver object for sure, which may
 result in false positives as well.

For example, `[[1, 2], [3, nil]].reject { |first, second| second.nil? }`
and `[[1, 2], [3, nil]].compact` are not compatible. This will work fine
when the receiver is a hash object.

### Example:
    # bad
    array.reject(&:nil?)
    array.reject { |e| e.nil? }
    array.select { |e| !e.nil? }

    # good
    array.compact

    # bad
    hash.reject!(&:nil?)
    hash.reject! { |k, v| v.nil? }
    hash.select! { |k, v| !v.nil? }

    # good
    hash.compact!
