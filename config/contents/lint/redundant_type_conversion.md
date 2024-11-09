Checks for redundant uses of `to_s`, `to_sym`, `to_i`, `to_f`, `to_d`, `to_r`, `to_c`,
`to_a`, `to_h`, and `to_set`.

When one of these methods is called on an object of the same type, that object
is returned, making the call unnecessary. The cop detects conversion methods called
on object literals, class constructors, class `[]` methods, and the `Kernel` methods
`String()`, `Integer()`, `Float()`, BigDecimal(), `Rational()`, `Complex()`, and `Array()`.

Specifically, these cases are detected for each conversion method:

* `to_s` when called on a string literal, interpolated string, heredoc,
    or with `String.new` or `String()`.
* `to_sym` when called on a symbol literal or interpolated symbol.
* `to_i` when called on an integer literal or with `Integer()`.
* `to_f` when called on a float literal of with `Float()`.
* `to_r` when called on a rational literal or with `Rational()`.
* `to_c` when called on a complex literal of with `Complex()`.
* `to_a` when called on an array literal, or with `Array.new`, `Array()` or `Array[]`.
* `to_h` when called on a hash literal, or with `Hash.new`, `Hash()` or `Hash[]`.
* `to_set` when called on `Set.new` or `Set[]`.

In all cases, chaining one same `to_*` conversion methods listed above is redundant.

The cop can also register an offense for chaining conversion methods on methods that are
expected to return a specific type regardless of receiver (eg. `foo.inspect.to_s` and
`foo.to_json.to_s`).

### Example:
    # bad
    "text".to_s
    :sym.to_sym
    42.to_i
    8.5.to_f
    12r.to_r
    1i.to_c
    [].to_a
    {}.to_h
    Set.new.to_set

    # good
    "text"
    :sym
    42
    8.5
    12r
    1i
    []
    {}
    Set.new

    # bad
    Integer(var).to_i

    # good
    Integer(var)

    # good - chaining to a type constructor with exceptions suppressed
    # in this case, `Integer()` could return `nil`
    Integer(var, exception: false).to_i

    # bad - chaining the same conversion
    foo.to_s.to_s

    # good
    foo.to_s

    # bad - chaining a conversion to a method that is expected to return the same type
    foo.inspect.to_s
    foo.to_json.to_s

    # good
    foo.inspect
    foo.to_json
