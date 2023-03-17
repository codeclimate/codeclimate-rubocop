Checks for redundant heredoc delimiter quotes.

### Example:

    # bad
    do_something(<<~'EOS')
      no string interpolation style text
    EOS

    # good
    do_something(<<~EOS)
      no string interpolation style text
    EOS

    do_something(<<~'EOS')
      #{string_interpolation_style_text_not_evaluated}
    EOS

    do_something(<<~'EOS')
      Preserve \
      newlines
    EOS
