Checks for space between the name of a receiver and a left
brackets.

This cop is marked as unsafe because it can occur false positives
for `do_something [this_is_an_array_literal_argument]` that take
an array without parentheses as an argument.

### Example:

    # bad
    collection [index_or_key]

    # good
    collection[index_or_key]
