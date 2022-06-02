Checks for non-local exits from iterators without a return
value. It registers an offense under these conditions:

* No value is returned,
* the block is preceded by a method chain,
* the block has arguments,
* the method which receives the block is not `define_method`
or `define_singleton_method`,
* the return is not contained in an inner scope, e.g. a lambda or a
method definition.

### Example:

    class ItemApi
      rescue_from ValidationError do |e| # non-iteration block with arg
        return { message: 'validation error' } unless e.errors # allowed
        error_array = e.errors.map do |error| # block with method chain
          return if error.suppress? # warned
          return "#{error.param}: invalid" unless error.message # allowed
          "#{error.param}: #{error.message}"
        end
        { message: 'validation error', errors: error_array }
      end

      def update_items
        transaction do # block without arguments
          return unless update_necessary? # allowed
          find_each do |item| # block without method chain
            return if item.stock == 0 # false-negative...
            item.update!(foobar: true)
          end
        end
      end
    end
