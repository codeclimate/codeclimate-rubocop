This cop checks for single-line method definitions that contain a body.
It will accept single-line methods with no body.

Endless methods added in Ruby 3.0 are also accepted by this cop.

### Example:
    # bad
    def some_method; body end
    def link_to(url); {:name => url}; end
    def @table.columns; super; end

    # good
    def self.resource_class=(klass); end
    def @table.columns; end
    def some_method() = body

### Example: AllowIfMethodIsEmpty: true (default)
    # good
    def no_op; end

### Example: AllowIfMethodIsEmpty: false
    # bad
    def no_op; end
