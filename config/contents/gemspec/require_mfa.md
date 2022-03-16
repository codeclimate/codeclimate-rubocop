Requires a gemspec to have `rubygems_mfa_required` metadata set.

This setting tells RubyGems that MFA (Multi-Factor Authentication) is
required for accounts to be able perform privileged operations, such as
(see RubyGems' documentation for the full list of privileged
operations):

* `gem push`
* `gem yank`
* `gem owner --add/remove`
* adding or removing owners using gem ownership page

This helps make your gem more secure, as users can be more
confident that gem updates were pushed by maintainers.

### Example:
    # bad
    Gem::Specification.new do |spec|
      # no `rubygems_mfa_required` metadata specified
    end

    # good
    Gem::Specification.new do |spec|
      spec.metadata = {
        'rubygems_mfa_required' => 'true'
      }
    end

    # good
    Gem::Specification.new do |spec|
      spec.metadata['rubygems_mfa_required'] = 'true'
    end

    # bad
    Gem::Specification.new do |spec|
      spec.metadata = {
        'rubygems_mfa_required' => 'false'
      }
    end

    # good
    Gem::Specification.new do |spec|
      spec.metadata = {
        'rubygems_mfa_required' => 'true'
      }
    end

    # bad
    Gem::Specification.new do |spec|
      spec.metadata['rubygems_mfa_required'] = 'false'
    end

    # good
    Gem::Specification.new do |spec|
      spec.metadata['rubygems_mfa_required'] = 'true'
    end
