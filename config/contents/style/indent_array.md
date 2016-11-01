This cop checks the indentation of the first element in an array literal
where the opening bracket and the first element are on separate lines.
The other elements' indentations are handled by the AlignArray cop.

By default, array literals that are arguments in a method call with
parentheses, and where the opening square bracket of the array is on the
same line as the opening parenthesis of the method call, shall have
their first element indented one step (two spaces) more than the
position inside the opening parenthesis.

Other array literals shall have their first element indented one step
more than the start of the line where the opening square bracket is.

This default style is called 'special_inside_parentheses'. Alternative
styles are 'consistent' and 'align_brackets'. Here are examples:

      # special_inside_parentheses
      array = [
        :value
      ]
      but_in_a_method_call([
                             :its_like_this
                           ])
      # consistent
      array = [
        :value
      ]
      and_in_a_method_call([
        :no_difference
      ])
      # align_brackets
      and_now_for_something = [
                                :completely_different
                              ]
