Checks for overwriting an exception with an exception result by use ``rescue =>``.

You intended to write as `rescue StandardError`.
However, you have written `rescue => StandardError`.
In that case, the result of `rescue` will overwrite `StandardError`.

### Example:

    # bad
    begin
      something
    rescue => StandardError
    end

    # good
    begin
      something
    rescue StandardError
    end
