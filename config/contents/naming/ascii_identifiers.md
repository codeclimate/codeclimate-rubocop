This cop checks for non-ascii characters in identifier names.

### Example:
    # bad
    def καλημερα # Greek alphabet (non-ascii)
    end

    # bad
    def こんにちはと言う # Japanese character (non-ascii)
    end

    # bad
    def hello_🍣 # Emoji (non-ascii)
    end

    # good
    def say_hello
    end

    # bad
    신장 = 10 # Hangul character (non-ascii)

    # good
    height = 10

    # bad
    params[:عرض_gteq] # Arabic character (non-ascii)

    # good
    params[:width_gteq]
