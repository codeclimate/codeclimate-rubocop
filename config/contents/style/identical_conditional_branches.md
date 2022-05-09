This cop checks for identical expressions at the beginning or end of
each branch of a conditional expression. Such expressions should normally
be placed outside the conditional expression - before or after it.

NOTE: The cop is poorly named and some people might think that it actually
checks for duplicated conditional branches. The name will probably be changed
in a future major RuboCop release.

### Safety:

Auto-correction is unsafe because changing the order of method invocations
may change the behavior of the code. For example:

```ruby
if method_that_modifies_global_state # 1
  method_that_relies_on_global_state # 2
  foo                                # 3
else
  method_that_relies_on_global_state # 2
  bar                                # 3
end
```

In this example, `method_that_relies_on_global_state` will be moved before
`method_that_modifies_global_state`, which changes the behavior of the program.

### Example:
    # bad
    if condition
      do_x
      do_z
    else
      do_y
      do_z
    end

    # good
    if condition
      do_x
    else
      do_y
    end
    do_z

    # bad
    if condition
      do_z
      do_x
    else
      do_z
      do_y
    end

    # good
    do_z
    if condition
      do_x
    else
      do_y
    end

    # bad
    case foo
    when 1
      do_x
    when 2
      do_x
    else
      do_x
    end

    # good
    case foo
    when 1
      do_x
      do_y
    when 2
      # nothing
    else
      do_x
      do_z
    end

    # bad
    case foo
    in 1
      do_x
    in 2
      do_x
    else
      do_x
    end

    # good
    case foo
    in 1
      do_x
      do_y
    in 2
      # nothing
    else
      do_x
      do_z
    end