Checks for the use of the send method.

### Example:
    # bad
    Foo.send(bar)
    quuz.send(fred)

    # good
    Foo.__send__(bar)
    quuz.public_send(fred)