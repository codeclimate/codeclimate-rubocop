This cop looks for has_(one|many) and belongs_to associations where
ActiveRecord can't automatically determine the inverse association
because of a scope or the options used. This can result in unnecessary
queries in some circumstances. `:inverse_of` must be manually specified
for associations to work in both ways, or set to `false` to opt-out.

### Example:
    # bad
    class Blog < ApplicationRecord
      has_many :recent_posts, -> { order(published_at: :desc) }
    end

    # good
    class Blog < ApplicationRecord
      has_many(:recent_posts,
        -> { order(published_at: :desc) },
        inverse_of: :blog
      )
    end

@see http://guides.rubyonrails.org/association_basics.html#bi-directional-associations
@see http://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html#module-ActiveRecord::Associations::ClassMethods-label-Setting+Inverses