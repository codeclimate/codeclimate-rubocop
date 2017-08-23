Gems should be alphabetically sorted within groups.

### Example:
    # bad
    gem 'rubocop'
    gem 'rspec'

    # good
    gem 'rspec'
    gem 'rubocop'

    # good
    gem 'rubocop'

    gem 'rspec'

    # good only if TreatCommentsAsGroupSeparators is true
    # For code quality
    gem 'rubocop'
    # For tests
    gem 'rspec'