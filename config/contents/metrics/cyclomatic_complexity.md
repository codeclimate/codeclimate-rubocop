This cop checks that the cyclomatic complexity of methods is not higher
than the configured maximum. The cyclomatic complexity is the number of
linearly independent paths through a method. The algorithm counts
decision points and adds one.

An if statement (or unless or ?:) increases the complexity by one. An
else branch does not, since it doesn't add a decision point. The &&
operator (or keyword and) can be converted to a nested if statement,
and ||/or is shorthand for a sequence of ifs, so they also add one.
Loops can be said to have an exit condition, so they add one.