This cop checks for the use of the has_and_belongs_to_many macro.

### Example:
    # bad
    # has_and_belongs_to_many :ingredients

    # good
    # has_many :ingredients, through: :recipe_ingredients