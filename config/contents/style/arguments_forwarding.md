In Ruby 2.7, arguments forwarding has been added.

This cop identifies places where `do_something(*args, &block)`
can be replaced by `do_something(...)`.

In Ruby 3.1, anonymous block forwarding has been added.

This cop identifies places where `do_something(&block)` can be replaced
by `do_something(&)`; if desired, this functionality can be disabled
by setting `UseAnonymousForwarding: false`.

In Ruby 3.2, anonymous args/kwargs forwarding has been added.

This cop also identifies places where `use_args(*args)`/`use_kwargs(**kwargs)` can be
replaced by `use_args(*)`/`use_kwargs(**)`; if desired, this functionality can be disabled
by setting `UseAnonymousForwarding: false`.

And this cop has `RedundantRestArgumentNames`, `RedundantKeywordRestArgumentNames`,
and `RedundantBlockArgumentNames` options. This configuration is a list of redundant names
that are sufficient for anonymizing meaningless naming.

Meaningless names that are commonly used can be anonymized by default:
e.g., `*args`, `**options`, `&block`, and so on.

Names not on this list are likely to be meaningful and are allowed by default.

This cop handles not only method forwarding but also forwarding to `super`.

### Example:
    # bad
    def foo(*args, &block)
      bar(*args, &block)
    end

    # bad
    def foo(*args, **kwargs, &block)
      bar(*args, **kwargs, &block)
    end

    # good
    def foo(...)
      bar(...)
    end

### Example: UseAnonymousForwarding: true (default, only relevant for Ruby >= 3.2)
    # bad
    def foo(*args, **kwargs, &block)
      args_only(*args)
      kwargs_only(**kwargs)
      block_only(&block)
    end

    # good
    def foo(*, **, &)
      args_only(*)
      kwargs_only(**)
      block_only(&)
    end

### Example: UseAnonymousForwarding: false (only relevant for Ruby >= 3.2)
    # good
    def foo(*args, **kwargs, &block)
      args_only(*args)
      kwargs_only(**kwargs)
      block_only(&block)
    end

### Example: AllowOnlyRestArgument: true (default, only relevant for Ruby < 3.2)
    # good
    def foo(*args)
      bar(*args)
    end

    def foo(**kwargs)
      bar(**kwargs)
    end

### Example: AllowOnlyRestArgument: false (only relevant for Ruby < 3.2)
    # bad
    # The following code can replace the arguments with `...`,
    # but it will change the behavior. Because `...` forwards block also.
    def foo(*args)
      bar(*args)
    end

    def foo(**kwargs)
      bar(**kwargs)
    end

### Example: RedundantRestArgumentNames: ['args', 'arguments'] (default)
    # bad
    def foo(*args)
      bar(*args)
    end

    # good
    def foo(*)
      bar(*)
    end

### Example: RedundantKeywordRestArgumentNames: ['kwargs', 'options', 'opts'] (default)
    # bad
    def foo(**kwargs)
      bar(**kwargs)
    end

    # good
    def foo(**)
      bar(**)
    end

### Example: RedundantBlockArgumentNames: ['blk', 'block', 'proc'] (default)
    # bad - But it is good with `EnforcedStyle: explicit` set for `Naming/BlockForwarding`.
    def foo(&block)
      bar(&block)
    end

    # good
    def foo(&)
      bar(&)
    end