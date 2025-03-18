Looks for endless methods inside operations of lower precedence (`and`, `or`, and
modifier forms of `if`, `unless`, `while`, `until`) that are ambiguous due to
lack of parentheses. This may lead to unexpected behavior as the code may appear
to use these keywords as part of the method but in fact they modify
the method definition itself.

In these cases, using a normal method definition is more clear.

### Example:

    # bad
    def foo = true if bar

    # good - using a non-endless method is more explicit
    def foo
      true
    end if bar

    # ok - method body is explicit
    def foo = (true if bar)

    # ok - method definition is explicit
    (def foo = true) if bar