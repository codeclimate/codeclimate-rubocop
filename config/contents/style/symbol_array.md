This cop can check for array literals made up of symbols that are not
using the %i() syntax.

Alternatively, it checks for symbol arrays using the %i() syntax on
projects which do not want to use that syntax, perhaps because they
support a version of Ruby lower than 2.0.