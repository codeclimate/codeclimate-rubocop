Enforce that development dependencies for a gem are specified in
`Gemfile`, rather than in the `gemspec` using
`add_development_dependency`. Alternatively, using `EnforcedStyle:
gemspec`, enforce that all dependencies are specified in `gemspec`,
rather than in `Gemfile`.

### Example: EnforcedStyle: Gemfile (default)
    # Specify runtime dependencies in your gemspec,
    # but all other dependencies in your Gemfile.

    # bad
    # example.gemspec
    s.add_development_dependency "foo"

    # good
    # Gemfile
    gem "foo"

    # good
    # gems.rb
    gem "foo"

    # good (with AllowedGems: ["bar"])
    # example.gemspec
    s.add_development_dependency "bar"

### Example: EnforcedStyle: gems.rb
    # Specify runtime dependencies in your gemspec,
    # but all other dependencies in your Gemfile.
    #
    # Identical to `EnforcedStyle: Gemfile`, but with a different error message.
    # Rely on Bundler/GemFilename to enforce the use of `Gemfile` vs `gems.rb`.

    # bad
    # example.gemspec
    s.add_development_dependency "foo"

    # good
    # Gemfile
    gem "foo"

    # good
    # gems.rb
    gem "foo"

    # good (with AllowedGems: ["bar"])
    # example.gemspec
    s.add_development_dependency "bar"

### Example: EnforcedStyle: gemspec
    # Specify all dependencies in your gemspec.

    # bad
    # Gemfile
    gem "foo"

    # good
    # example.gemspec
    s.add_development_dependency "foo"

    # good (with AllowedGems: ["bar"])
    # Gemfile
    gem "bar"
