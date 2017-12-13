Checks that `required_ruby_version` of gemspec and `TargetRubyVersion`
of .rubocop.yml are equal.
Thereby, RuboCop to perform static analysis working on the version
required by gemspec.

### Example:
    # When `TargetRubyVersion` of .rubocop.yml is `2.3`.

    # bad
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.2.0'
    end

    # bad
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.4.0'
    end

    # good
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.3.0'
    end

    # good
    Gem::Specification.new do |spec|
      spec.required_ruby_version = '>= 2.3'
    end

    # good
    Gem::Specification.new do |spec|
      spec.required_ruby_version = ['>= 2.3.0', '< 2.5.0']
    end