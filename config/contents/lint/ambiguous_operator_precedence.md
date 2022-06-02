Looks for expressions containing multiple binary operators
where precedence is ambiguous due to lack of parentheses. For example,
in `1 + 2 * 3`, the multiplication will happen before the addition, but
lexically it appears that the addition will happen first.

The cop does not consider unary operators (ie. `!a` or `-b`) or comparison
operators (ie. `a =~ b`) because those are not ambiguous.

NOTE: Ranges are handled by `Lint/AmbiguousRange`.

### Example:
    # bad
    a + b * c
    a || b && c
    a ** b + c

    # good (different precedence)
    a + (b * c)
    a || (b && c)
    (a ** b) + c

    # good (same precedence)
    a + b + c
    a * b / c % d