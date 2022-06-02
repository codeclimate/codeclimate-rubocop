Checks for circular argument references in optional keyword
arguments and optional ordinal arguments.

This cop mirrors a warning produced by MRI since 2.2.

### Example:

    # bad

    def bake(pie: pie)
      pie.heat_up
    end

### Example:

    # good

    def bake(pie:)
      pie.refrigerate
    end

### Example:

    # good

    def bake(pie: self.pie)
      pie.feed_to(user)
    end

### Example:

    # bad

    def cook(dry_ingredients = dry_ingredients)
      dry_ingredients.reduce(&:+)
    end

### Example:

    # good

    def cook(dry_ingredients = self.dry_ingredients)
      dry_ingredients.combine
    end