Checks that deprecated attribute attributes are not set in a gemspec file.
Removing `test_files` allows the user to receive smaller packed gems.

### Example:

    # bad
    Gem::Specification.new do |spec|
      spec.name = 'your_cool_gem_name'
      spec.test_files = Dir.glob('test/**/*')
    end

    # bad
    Gem::Specification.new do |spec|
      spec.name = 'your_cool_gem_name'
      spec.test_files += Dir.glob('test/**/*')
    end

    # good
    Gem::Specification.new do |spec|
      spec.name = 'your_cool_gem_name'
    end
