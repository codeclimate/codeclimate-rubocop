Checks for cases where exceptions unrelated to the numeric constructors `Integer()`,
`Float()`, `BigDecimal()`, `Complex()`, and `Rational()` may be unintentionally swallowed.

### Safety:

The cop is unsafe for autocorrection because unexpected errors occurring in the argument
passed to numeric constructor (e.g., `Integer()`) can lead to incompatible behavior.
For example, changing it to `Integer(potential_exception_method_call, exception: false)`
ensures that exceptions raised by `potential_exception_method_call` are not ignored.

```ruby
Integer(potential_exception_method_call) rescue nil
```

### Example:

    # bad
    Integer(arg) rescue nil

    # bad
    begin
      Integer(arg)
    rescue
      nil
    end

    # bad
    begin
      Integer(arg)
    rescue
    end

    # good
    Integer(arg, exception: false)
