This cop checks for places where string concatenation
can be replaced with string interpolation.

### Example:
    # bad
    email_with_name = user.name + ' <' + user.email + '>'

    # good
    email_with_name = "#{user.name} <#{user.email}>"
    email_with_name = format('%s <%s>', user.name, user.email)
