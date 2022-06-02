Checks if empty lines exist around the bodies of `begin`
sections. This cop doesn't check empty lines at `begin` body
beginning/end and around method definition body.
`Style/EmptyLinesAroundBeginBody` or `Style/EmptyLinesAroundMethodBody`
can be used for this purpose.

### Example:

    # good

    begin
      do_something
    rescue
      do_something2
    else
      do_something3
    ensure
      do_something4
    end

    # good

    def foo
      do_something
    rescue
      do_something2
    end

    # bad

    begin
      do_something

    rescue

      do_something2

    else

      do_something3

    ensure

      do_something4
    end

    # bad

    def foo
      do_something

    rescue

      do_something2
    end