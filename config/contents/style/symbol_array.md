Checks for array literals made up of symbols that are not
using the %i() syntax.

Alternatively, it checks for symbol arrays using the %i() syntax on
projects which do not want to use that syntax, perhaps because they
support a version of Ruby lower than 2.0.

Configuration option: MinSize
If set, arrays with fewer elements than this value will not trigger the
cop. For example, a `MinSize` of `3` will not enforce a style on an
array of 2 or fewer elements.

### Example: EnforcedStyle: percent (default)
    # good
    %i[foo bar baz]

    # bad
    [:foo, :bar, :baz]

    # bad (contains spaces)
    %i[foo\ bar baz\ quux]

    # bad (contains [] with spaces)
    %i[foo \[ \]]

    # bad (contains () with spaces)
    %i(foo \( \))

### Example: EnforcedStyle: brackets
    # good
    [:foo, :bar, :baz]

    # bad
    %i[foo bar baz]