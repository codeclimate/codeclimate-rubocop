A Gem group, or a set of groups, should be listed only once in a Gemfile.

For example, if the values of `source`, `git`, `platforms`, or `path`
surrounding `group` are different, no offense will be registered:

[source,ruby]
-----
platforms :ruby do
    group :default do
      gem 'openssl'
    end
end

platforms :jruby do
    group :default do
      gem 'jruby-openssl'
    end
end
-----

### Example:
    # bad
    group :development do
      gem 'rubocop'
    end

    group :development do
      gem 'rubocop-rails'
    end

    # bad (same set of groups declared twice)
    group :development, :test do
      gem 'rubocop'
    end

    group :test, :development do
      gem 'rspec'
    end

    # good
    group :development do
      gem 'rubocop'
    end

    group :development, :test do
      gem 'rspec'
    end

    # good
    gem 'rubocop', groups: [:development, :test]
    gem 'rspec', groups: [:development, :test]
