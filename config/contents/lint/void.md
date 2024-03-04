Checks for operators, variables, literals, lambda, proc and nonmutating
methods used in void context.

`each` blocks are allowed to prevent false positives.
For example, the expression inside the `each` block below.
It's not void, especially when the receiver is an `Enumerator`:

```ruby
enumerator = [1, 2, 3].filter
enumerator.each { |item| item >= 2 } #=> [2, 3]
```

### Example: CheckForMethodsWithNoSideEffects: false (default)
    # bad
    def some_method
      some_num * 10
      do_something
    end

    def some_method(some_var)
      some_var
      do_something
    end

### Example: CheckForMethodsWithNoSideEffects: true
    # bad
    def some_method(some_array)
      some_array.sort
      do_something(some_array)
    end

    # good
    def some_method
      do_something
      some_num * 10
    end

    def some_method(some_var)
      do_something
      some_var
    end

    def some_method(some_array)
      some_array.sort!
      do_something(some_array)
    end