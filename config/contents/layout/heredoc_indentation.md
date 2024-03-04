Checks the indentation of the here document bodies. The bodies
are indented one step.

Note: When ``Layout/LineLength``'s `AllowHeredoc` is false (not default),
        this cop does not add any offenses for long here documents to
        avoid ``Layout/LineLength``'s offenses.

### Example:
    # bad
    <<-RUBY
    something
    RUBY

    # good
    <<~RUBY
      something
    RUBY
