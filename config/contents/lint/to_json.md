Checks to make sure `#to_json` includes an optional argument.
When overriding `#to_json`, callers may invoke JSON
generation via `JSON.generate(your_obj)`.  Since `JSON#generate` allows
for an optional argument, your method should too.

### Example:
    class Point
      attr_reader :x, :y

      # bad, incorrect arity
      def to_json
        JSON.generate([x, y])
      end

      # good, preserving args
      def to_json(*args)
        JSON.generate([x, y], *args)
      end

      # good, discarding args
      def to_json(*_args)
        JSON.generate([x, y])
      end
    end
