This cop looks for uses of Perl-style regexp match
backreferences like $1, $2, etc.

### Example:
    # bad
    puts $1

    # good
    puts Regexp.last_match(1)