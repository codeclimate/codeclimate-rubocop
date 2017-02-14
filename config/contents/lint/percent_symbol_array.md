This cop checks for colons and commas in %i, e.g.

    `%i(:foo, :bar)`

it is more likely that the additional characters are unintended (for
example, mistranslating an array of literals to percent string notation)
rather than meant to be part of the resulting symbols.