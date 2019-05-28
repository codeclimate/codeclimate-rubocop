This cop looks for belongs_to associations where we control whether the
association is required via the deprecated `required` option instead.

Since Rails 5, belongs_to associations are required by default and this
can be controlled through the use of `optional: true`.

From the release notes:

      belongs_to will now trigger a validation error by default if the
      association is not present. You can turn this off on a
      per-association basis with optional: true. Also deprecate required
      option in favor of optional for belongs_to. (Pull Request)

In the case that the developer is doing `required: false`, we
definitely want to autocorrect to `optional: true`.

However, without knowing whether they've set overridden the default
value of `config.active_record.belongs_to_required_by_default`, we
can't say whether it's safe to remove `required: true` or whether we
should replace it with `optional: false` (or, similarly, remove a
superfluous `optional: false`). Therefore, in the cases we're using
`required: true`, we'll simply invert it to `optional: false` and the
user can remove depending on their defaults.

### Example:
    # bad
    class Post < ApplicationRecord
      belongs_to :blog, required: false
    end

    # good
    class Post < ApplicationRecord
      belongs_to :blog, optional: true
    end

    # bad
    class Post < ApplicationRecord
      belongs_to :blog, required: true
    end

    # good
    class Post < ApplicationRecord
      belongs_to :blog, optional: false
    end

@see https://guides.rubyonrails.org/5_0_release_notes.html
@see https://github.com/rails/rails/pull/18937