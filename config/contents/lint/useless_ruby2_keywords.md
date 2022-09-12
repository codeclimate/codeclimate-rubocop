Looks for `ruby2_keywords` calls for methods that do not need it.

`ruby2_keywords` should only be called on methods that accept an argument splat
(`\*args`) but do not explicit keyword arguments (`k:` or `k: true`) or
a keyword splat (`**kwargs`).

### Example:
    # good (splat argument without keyword arguments)
    ruby2_keywords def foo(*args); end

    # bad (no arguments)
    ruby2_keywords def foo; end

    # good
    def foo; end

    # bad (positional argument)
    ruby2_keywords def foo(arg); end

    # good
    def foo(arg); end

    # bad (double splatted argument)
    ruby2_keywords def foo(**args); end

    # good
    def foo(**args); end

    # bad (keyword arguments)
    ruby2_keywords def foo(i:, j:); end

    # good
    def foo(i:, j:); end

    # bad (splat argument with keyword arguments)
    ruby2_keywords def foo(*args, i:, j:); end

    # good
    def foo(*args, i:, j:); end

    # bad (splat argument with double splat)
    ruby2_keywords def foo(*args, **kwargs); end

    # good
    def foo(*args, **kwargs); end

    # bad (ruby2_keywords given a symbol)
    def foo; end
    ruby2_keywords :foo

    # good
    def foo; end

    # bad (ruby2_keywords with dynamic method)
    define_method(:foo) { |arg| }
    ruby2_keywords :foo

    # good
    define_method(:foo) { |arg| }
