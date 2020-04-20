Checks method call operators to not have spaces around them.

### Example:
    # bad
    foo. bar
    foo .bar
    foo . bar
    foo. bar .buzz
    foo
      . bar
      . buzz
    foo&. bar
    foo &.bar
    foo &. bar
    foo &. bar&. buzz
    RuboCop:: Cop
    RuboCop:: Cop:: Cop
    :: RuboCop::Cop

    # good
    foo.bar
    foo.bar.buzz
    foo
      .bar
      .buzz
    foo&.bar
    foo&.bar&.buzz
    RuboCop::Cop
    RuboCop::Cop::Cop
    ::RuboCop::Cop
