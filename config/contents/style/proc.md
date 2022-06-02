Checks for uses of Proc.new where Kernel#proc
would be more appropriate.

### Example:
    # bad
    p = Proc.new { |n| puts n }

    # good
    p = proc { |n| puts n }
