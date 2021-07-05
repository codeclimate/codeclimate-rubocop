Enforce that Gem version specifications or a commit reference (branch,
ref, or tag) are either required or forbidden.

### Example: EnforcedStyle: required (default)
 # bad
 gem 'rubocop'

 # good
 gem 'rubocop', '~> 1.12'

 # good
 gem 'rubocop', '>= 1.10.0'

 # good
 gem 'rubocop', '>= 1.5.0', '< 1.10.0'

 # good
 gem 'rubocop', branch: 'feature-branch'

 # good
 gem 'rubocop', ref: '74b5bfbb2c4b6fd6cdbbc7254bd7084b36e0c85b'

 # good
 gem 'rubocop', tag: 'v1.17.0'

### Example: EnforcedStyle: forbidden
 # good
 gem 'rubocop'

 # bad
 gem 'rubocop', '~> 1.12'

 # bad
 gem 'rubocop', '>= 1.10.0'

 # bad
 gem 'rubocop', '>= 1.5.0', '< 1.10.0'

 # bad
 gem 'rubocop', branch: 'feature-branch'

 # bad
 gem 'rubocop', ref: '74b5bfbb2c4b6fd6cdbbc7254bd7084b36e0c85b'

 # bad
 gem 'rubocop', tag: 'v1.17.0'
