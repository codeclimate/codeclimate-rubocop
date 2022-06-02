Verifies that a project contains Gemfile or gems.rb file and correct
associated lock file based on the configuration.

### Example: EnforcedStyle: Gemfile (default)
    # bad
    Project contains gems.rb and gems.locked files

    # bad
    Project contains Gemfile and gems.locked file

    # good
    Project contains Gemfile and Gemfile.lock

### Example: EnforcedStyle: gems.rb
    # bad
    Project contains Gemfile and Gemfile.lock files

    # bad
    Project contains gems.rb and Gemfile.lock file

    # good
    Project contains gems.rb and gems.locked files