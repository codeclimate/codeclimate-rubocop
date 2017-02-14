This cop checks for quotes and commas in %w, e.g.

    `%w('foo', "bar")`

it is more likely that the additional characters are unintended (for
example, mistranslating an array of literals to percent string notation)
rather than meant to be part of the resulting strings.