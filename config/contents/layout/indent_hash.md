This cops checks the indentation of the first key in a hash literal
where the opening brace and the first key are on separate lines. The
other keys' indentations are handled by the AlignHash cop.

By default, Hash literals that are arguments in a method call with
parentheses, and where the opening curly brace of the hash is on the
same line as the opening parenthesis of the method call, shall have
their first key indented one step (two spaces) more than the position
inside the opening parenthesis.

Other hash literals shall have their first key indented one step more
than the start of the line where the opening curly brace is.

This default style is called 'special_inside_parentheses'. Alternative
styles are 'consistent' and 'align_braces'. Here are examples:

### Example: EnforcedStyle: special_inside_parentheses (default)
    # The `special_inside_parentheses` style enforces that the first key
    # in a hash literal where the opening brace and the first key are on
    # separate lines is indented one step (two spaces) more than the
    # position inside the opening parentheses.

    # bad
    hash = {
      key: :value
    }
    and_in_a_method_call({
      no: :difference
                         })

    # good
    special_inside_parentheses
    hash = {
      key: :value
    }
    but_in_a_method_call({
                           its_like: :this
                         })

### Example: EnforcedStyle: consistent
    # The `consistent` style enforces that the first key in a hash
    # literal where the opening brace and the first key are on
    # seprate lines is indented the same as a hash literal which is not
    # defined inside a method call.

    # bad
    hash = {
      key: :value
    }
    but_in_a_method_call({
                           its_like: :this
                          })

    # good
    hash = {
      key: :value
    }
    and_in_a_method_call({
      no: :difference
    })

### Example: EnforcedStyle: align_braces
    # The `align_brackets` style enforces that the opening and closing
    # braces are indented to the same position.

    # bad
    and_now_for_something = {
                              completely: :different
    }

    # good
    and_now_for_something = {
                              completely: :different
                            }