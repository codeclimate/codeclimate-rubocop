This cop checks for uses of double negation (!!) to convert something
to a boolean value. As this is both cryptic and usually redundant, it
should be avoided.

### Example:

    # bad
    !!something

    # good
    !something.nil?

Please, note that when something is a boolean value
!!something and !something.nil? are not the same thing.
As you're unlikely to write code that can accept values of any type
this is rarely a problem in practice.