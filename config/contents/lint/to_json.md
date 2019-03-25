This cop checks to make sure `#to_json` includes an optional argument.
When overriding `#to_json`, callers may invoke JSON
generation via `JSON.generate(your_obj)`.  Since `JSON#generate` allows
for an optional argument, your method should too.

### Example:
    # bad
    def to_json
    end

    # good
    def to_json(_opts)
    end
