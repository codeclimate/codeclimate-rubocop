Enforces the use of consistent method names
from the Enumerable module.

You can customize the mapping from undesired method to desired method.

e.g. to use `detect` over `find`:

    Style/CollectionMethods:
      PreferredMethods:
        find: detect

### Safety:

This cop is unsafe because it finds methods by name, without actually
being able to determine if the receiver is an Enumerable or not, so
this cop may register false positives.

### Example:
    # These examples are based on the default mapping for `PreferredMethods`.

    # bad
    items.collect
    items.collect!
    items.collect_concat
    items.inject
    items.detect
    items.find_all
    items.member?

    # good
    items.map
    items.map!
    items.flat_map
    items.reduce
    items.find
    items.select
    items.include?
