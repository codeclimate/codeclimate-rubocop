Checks for unnecessary `require` statement.

The following features are unnecessary `require` statement because
they are already loaded. e.g. Ruby 2.2:

    ruby -ve 'p $LOADED_FEATURES.reject { |feature| %r|/| =~ feature }'
    ruby 2.2.8p477 (2017-09-14 revision 59906) [x86_64-darwin13]
    ["enumerator.so", "rational.so", "complex.so", "thread.rb"]

Below are the features that each `TargetRubyVersion` targets.

    * 2.0+ ... `enumerator`
    * 2.1+ ... `thread`
    * 2.2+ ... Add `rational` and `complex` above
    * 2.5+ ... Add `pp` above
    * 2.7+ ... Add `ruby2_keywords` above
    * 3.1+ ... Add `fiber` above
    * 3.2+ ... `set`

This cop target those features.

### Safety:

This cop's autocorrection is unsafe because if `require 'pp'` is removed from one file,
`NameError` can be encountered when another file uses `PP.pp`.

### Example:
    # bad
    require 'unloaded_feature'
    require 'thread'

    # good
    require 'unloaded_feature'