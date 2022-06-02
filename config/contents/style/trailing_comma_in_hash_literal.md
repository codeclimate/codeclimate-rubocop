Checks for trailing comma in hash literals.
The configuration options are:

* `consistent_comma`: Requires a comma after the
last item of all non-empty, multiline hash literals.
* `comma`: Requires a comma after the last item in a hash,
but only when each item is on its own line.
* `no_comma`: Does not require a comma after the
last item in a hash

### Example: EnforcedStyleForMultiline: consistent_comma

    # bad
    a = { foo: 1, bar: 2, }

    # good
    a = { foo: 1, bar: 2 }

    # good
    a = {
      foo: 1, bar: 2,
      qux: 3,
    }

    # good
    a = {
      foo: 1, bar: 2, qux: 3,
    }

    # good
    a = {
      foo: 1,
      bar: 2,
    }

### Example: EnforcedStyleForMultiline: comma

    # bad
    a = { foo: 1, bar: 2, }

    # good
    a = { foo: 1, bar: 2 }

    # bad
    a = {
      foo: 1, bar: 2,
      qux: 3,
    }

    # good
    a = {
      foo: 1, bar: 2,
      qux: 3
    }

    # bad
    a = {
      foo: 1, bar: 2, qux: 3,
    }

    # good
    a = {
      foo: 1, bar: 2, qux: 3
    }

    # good
    a = {
      foo: 1,
      bar: 2,
    }

### Example: EnforcedStyleForMultiline: no_comma (default)

    # bad
    a = { foo: 1, bar: 2, }

    # good
    a = {
      foo: 1,
      bar: 2
    }