This cop checks that comment annotation keywords are written according
to guidelines.

NOTE: With a multiline comment block (where each line is only a
comment), only the first line will be able to register an offense, even
if an annotation keyword starts another line. This is done to prevent
incorrect registering of keywords (eg. `review`) inside a paragraph as an
annotation.

### Example:
    # bad
    # TODO make better

    # good
    # TODO: make better

    # bad
    # TODO:make better

    # good
    # TODO: make better

    # bad
    # fixme: does not work

    # good
    # FIXME: does not work

    # bad
    # Optimize does not work

    # good
    # OPTIMIZE: does not work