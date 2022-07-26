Checks for using empty heredoc to reduce redundancy.

### Example:

    # bad
    <<~EOS
    EOS

    <<-EOS
    EOS

    <<EOS
    EOS

    # good
    ''

    # bad
    do_something(<<~EOS)
    EOS

    do_something(<<-EOS)
    EOS

    do_something(<<EOS)
    EOS

    # good
    do_something('')
