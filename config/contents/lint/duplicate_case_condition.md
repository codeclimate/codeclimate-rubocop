This cop checks that there are no repeated conditions
used in case 'when' expressions.

### Example:

     # bad
     case x
     when 'first'
       do_something
     when 'first'
       do_something_else
     end
