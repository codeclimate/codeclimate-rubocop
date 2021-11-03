Checks that `required_ruby_version` in a gemspec file is set to a valid
value (non-blank) and matches `TargetRubyVersion` as set in RuboCop's
configuration for the gem.

This ensures that RuboCop is using the same Ruby version as the gem.

### Example:
    # When `TargetRubyVersion` of .rubocop.yml is `2.5`.

    # bad
    Gem::Specification.new do |spec|
      # no `required_ruby_version` specified
    end

    # bad
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.4.0'
    end

    # bad
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.6.0'
    end

    # bad
    Gem::Specification.new do |spec|
      spec.required_ruby_version = ''
    end

    # good
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.5.0'
    end

    # good
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.5'
    end

    # accepted but not recommended
    Gem::Specification.new do |spec|
      spec.required_ruby_version = ['>= 2.5.0', '< 2.7.0']
    end

    # accepted but not recommended, since
    # Ruby does not really follow semantic versioning
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '~> 2.5'
    end