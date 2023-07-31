Checks for uses of `rescue` in its modifier form is added for following
reasons:

* The syntax of modifier form `rescue` can be misleading because it
    might lead us to believe that `rescue` handles the given exception
    but it actually rescue all exceptions to return the given rescue
    block. In this case, value returned by handle_error or
    SomeException.

* Modifier form `rescue` would rescue all the exceptions. It would
    silently skip all exception or errors and handle the error.
    Example: If `NoMethodError` is raised, modifier form rescue would
    handle the exception.

### Example:
    # bad
    some_method rescue handle_error

    # bad
    some_method rescue SomeException

    # good
    begin
      some_method
    rescue
      handle_error
    end

    # good
    begin
      some_method
    rescue SomeException
      handle_error
    end