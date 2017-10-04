This cop checks for places where the `#__dir__` method can replace more
complex constructs to retrieve a canonicalized absolute path to the
current file.

### Example:
    # bad
    path = File.expand_path(File.dirname(__FILE__))

    # bad
    path = File.dirname(File.realpath(__FILE__))

    # good
    path = __dir__