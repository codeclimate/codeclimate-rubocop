Checks for uses of the character literal ?x.
Starting with Ruby 1.9 character literals are
essentially one-character strings, so this syntax
is mostly redundant at this point.

? character literal can be used to express meta and control character.
That's a good use case of ? literal so it doesn't count it as an offense.

### Example:
    # bad
    ?x

    # good
    'x'

    # good - control & meta escapes
    ?\C-\M-d
    "\C-\M-d" # same as above