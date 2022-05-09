Checks that `RUBY_VERSION` constant is not used in gemspec.
Using `RUBY_VERSION` is dangerous because value of the
constant is determined by `rake release`.
It's possible to have dependency based on ruby version used
to execute `rake release` and not user's ruby version.

### Example:

    # bad
    Gem::Specification.new do |spec|
      if RUBY_VERSION >= '3.0'
        spec.add_runtime_dependency 'gem_a'
      else
        spec.add_runtime_dependency 'gem_b'
      end
    end

    # good
    Gem::Specification.new do |spec|
      spec.add_runtime_dependency 'gem_a'
    end
