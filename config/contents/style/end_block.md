Checks for END blocks.

### Example:
    # bad
    END { puts 'Goodbye!' }

    # good
    at_exit { puts 'Goodbye!' }
