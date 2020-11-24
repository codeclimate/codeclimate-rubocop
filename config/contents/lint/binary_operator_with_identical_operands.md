This cop checks for places where binary operator has identical operands.

It covers arithmetic operators: `+`, `-`, `*`, `/`, `%`, `**`;
comparison operators: `==`, `===`, `=~`, `>`, `>=`, `<`, `<=`;
bitwise operators: `|`, `^`, `&`, `<<`, `>>`;
boolean operators: `&&`, `||`
and "spaceship" operator - `<=>`.

This cop is marked as unsafe as it does not consider side effects when calling methods
and thus can generate false positives:
    if wr.take_char == '\0' && wr.take_char == '\0'

### Example:
    # bad
    x / x
    x.top >= x.top

    if a.x != 0 && a.x != 0
      do_something
    end

    def childs?
      left_child || left_child
    end

    # good
    x + x
    1 << 1
