Enforce that Gem version specifications are either required
or forbidden.

### Example: EnforcedStyle: required (default)
 # bad
 gem 'rubocop'

 # good
 gem 'rubocop', '~> 1.12'

 # good
 gem 'rubocop', '>= 1.10.0'

 # good
 gem 'rubocop', '>= 1.5.0', '< 1.10.0'

### Example: EnforcedStyle: forbidden
 # good
 gem 'rubocop'

 # bad
 gem 'rubocop', '~> 1.12'

 # bad
 gem 'rubocop', '>= 1.10.0'

 # bad
 gem 'rubocop', '>= 1.5.0', '< 1.10.0'
