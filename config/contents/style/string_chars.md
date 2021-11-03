Checks for uses of `String#split` with empty string or regexp literal argument.

### Safety:

This cop is unsafe because it cannot be guaranteed that the receiver
is actually a string. If another class has a `split` method with
different behaviour, it would be registered as a false positive.

### Example:
    # bad
    string.split(//)
    string.split('')

    # good
    string.chars
