An attribute assignment method calls should be listed only once
in a gemspec.

Assigning to an attribute with the same name using `spec.foo =` will be
an unintended usage. On the other hand, duplication of methods such
as `spec.requirements`, `spec.add_runtime_dependency`, and others are
permitted because it is the intended use of appending values.

### Example:
    # bad
    Gem::Specification.new do |spec|
      spec.name = 'rubocop'
      spec.name = 'rubocop2'
    end

    # good
    Gem::Specification.new do |spec|
      spec.name = 'rubocop'
    end

    # good
    Gem::Specification.new do |spec|
      spec.requirements << 'libmagick, v6.0'
      spec.requirements << 'A good graphics card'
    end

    # good
    Gem::Specification.new do |spec|
      spec.add_dependency('parallel', '~> 1.10')
      spec.add_dependency('parser', '>= 2.3.3.1', '< 3.0')
    end