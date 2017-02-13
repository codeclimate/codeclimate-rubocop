Prefer the use of uniq (or distinct), before pluck instead of after.

The use of uniq before pluck is preferred because it executes within
the database.

### Example:
    # bad
    Model.pluck(:id).uniq

    # good
    Model.uniq.pluck(:id)

This cop has two different enforcement modes. When the EnforcedStyle
is conservative (the default) then only calls to pluck on a constant
(i.e. a model class) before uniq are added as offenses.

When the EnforcedStyle is aggressive then all calls to pluck before
uniq are added as offenses. This may lead to false positives as the cop
cannot distinguish between calls to pluck on an ActiveRecord::Relation
vs a call to pluck on an ActiveRecord::Associations::CollectionProxy.

### Example:
    # this will return a Relation that pluck is called on
    Model.where(...).pluck(:id).uniq

    # an association on an instance will return a CollectionProxy
    instance.assoc.pluck(:id).uniq

Autocorrect is disabled by default for this cop since it may generate
false positives.
