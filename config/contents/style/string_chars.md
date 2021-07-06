Checks for uses of `String#split` with empty string or regexp literal argument.

This cop is marked as unsafe. But probably it's quite unlikely that some other class would
define a `split` method that takes exactly the same arguments.

### Example:
    # bad
    string.split(//)
    string.split('')

    # good
    string.chars
