Checks for non-nil checks, which are usually redundant.

With `IncludeSemanticChanges` set to `false` by default, this cop
does not report offenses for `!x.nil?` and does no changes that might
change behavior.
Also `IncludeSemanticChanges` set to `false` with `EnforcedStyle: comparison` of
`Style/NilComparison` cop, this cop does not report offenses for `x != nil` and
does no changes to `!x.nil?` style.

With `IncludeSemanticChanges` set to `true`, this cop reports offenses
for `!x.nil?` and autocorrects that and `x != nil` to solely `x`, which
is *usually* OK, but might change behavior.

### Example:
    # bad
    if x != nil
    end

    # good
    if x
    end

    # Non-nil checks are allowed if they are the final nodes of predicate.
    # good
    def signed_in?
      !current_user.nil?
    end

### Example: IncludeSemanticChanges: false (default)
    # good
    if !x.nil?
    end

### Example: IncludeSemanticChanges: true
    # bad
    if !x.nil?
    end
