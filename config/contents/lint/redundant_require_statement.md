Checks for unnecessary `require` statement.

The following features are unnecessary `require` statement because
they are already loaded.

ruby -ve 'p $LOADED_FEATURES.reject { |feature| %r|/| =~ feature }'
ruby 2.2.8p477 (2017-09-14 revision 59906) [x86_64-darwin13]
["enumerator.so", "rational.so", "complex.so", "thread.rb"]

This cop targets Ruby 2.2 or higher containing these 4 features.

### Example:
    # bad
    require 'unloaded_feature'
    require 'thread'

    # good
    require 'unloaded_feature'