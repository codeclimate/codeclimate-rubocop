This cops checks the indentation of the here document bodies. The bodies
are indented one step.
In Ruby 2.3 or newer, squiggly heredocs (`<<~`) should be used. If you
use the older rubies, you should introduce some library to your project
(e.g. ActiveSupport, Powerpack or Unindent).
Note: When `Metrics/LineLength`'s `AllowHeredoc` is false (not default),
        this cop does not add any offenses for long here documents to
        avoid `Metrics/LineLength`'s offenses.

### Example: EnforcedStyle: auto_detection (default)
    # bad
    <<-RUBY
    something
    RUBY

    # good
    # When using Ruby 2.3 or higher.
    <<~RUBY
      something
    RUBY

    # good
    # When using Ruby 2.2 or lower and enabled Rails department.
    # The following is possible to enable Rails department by
    # adding for example:
    #
    # Rails:
    #   Enabled: true
    #
    <<-RUBY.strip_heredoc
      something
    RUBY

### Example: EnforcedStyle: squiggly
    # good
    # When EnforcedStyle is squiggly, bad code is auto-corrected to the
    # following code.
    <<~RUBY
      something
    RUBY

### Example: EnforcedStyle: active_support
    # good
    # When EnforcedStyle is active_support, bad code is auto-corrected to
    # the following code.
    <<-RUBY.strip_heredoc
      something
    RUBY

### Example: EnforcedStyle: powerpack
    # good
    # When EnforcedStyle is powerpack, bad code is auto-corrected to
    # the following code.
    <<-RUBY.strip_indent
      something
    RUBY

### Example: EnforcedStyle: unindent
    # good
    # When EnforcedStyle is unindent, bad code is auto-corrected to
    # the following code.
    <<-RUBY.unindent
      something
    RUBY
