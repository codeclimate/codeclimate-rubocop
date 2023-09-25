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

### Example: TreatCommentsAsGroupSeparators: true (default)
    # good
    # For code quality
    gem 'rubocop'
    # For tests
    gem 'rspec'

### Example: TreatCommentsAsGroupSeparators: false
    # bad
    # For code quality
    gem 'rubocop'
    # For tests
    gem 'rspec'