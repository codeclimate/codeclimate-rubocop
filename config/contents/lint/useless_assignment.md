Checks for every useless assignment to local variable in every
scope.
The basic idea for this cop was from the warning of `ruby -cw`:

```console
assigned but unused variable - foo
```

Currently this cop has advanced logic that detects unreferenced
reassignments and properly handles varied cases such as branch, loop,
rescue, ensure, etc.

This cop's autocorrection avoids cases like `a ||= 1` because removing assignment from
operator assignment can cause `NameError` if this assignment has been used to declare
a local variable. For example, replacing `a ||= 1` with `a || 1` may cause
"undefined local variable or method `a' for main:Object (NameError)".

NOTE: Given the assignment `foo = 1, bar = 2`, removing unused variables
can lead to a syntax error, so this case is not autocorrected.

### Example:

    # bad
    def some_method
      some_var = 1
      do_something
    end

    # good
    def some_method
      some_var = 1
      do_something(some_var)
    end