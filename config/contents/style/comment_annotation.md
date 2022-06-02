Checks that comment annotation keywords are written according
to guidelines.

Annotation keywords can be specified by overriding the cop's `Keywords`
configuration. Keywords are allowed to be single words or phrases.

NOTE: With a multiline comment block (where each line is only a
comment), only the first line will be able to register an offense, even
if an annotation keyword starts another line. This is done to prevent
incorrect registering of keywords (eg. `review`) inside a paragraph as an
annotation.

### Example: RequireColon: true (default)
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

### Example: RequireColon: false
    # bad
    # TODO: make better

    # good
    # TODO make better

    # bad
    # fixme does not work

    # good
    # FIXME does not work

    # bad
    # Optimize does not work

    # good
    # OPTIMIZE does not work