Checks for `if` expressions that do not have an `else` branch.
SupportedStyles

if
### Example:
    # bad
    if condition
      statement
    end

case
### Example:
    # bad
    case var
    when condition
      statement
    end

### Example:
    # good
    if condition
      statement
    else
    # the content of the else branch will be determined by Style/EmptyElse
    end