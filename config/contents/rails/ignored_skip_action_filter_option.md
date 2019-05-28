This cop checks that `if` and `only` (or `except`) are not used together
as options of `skip_*` action filter.

The `if` option will be ignored when `if` and `only` are used together.
Similarly, the `except` option will be ignored when `if` and `except`
are used together.

### Example:
    # bad
    class MyPageController < ApplicationController
      skip_before_action :login_required,
        only: :show, if: :trusted_origin?
    end

    # good
    class MyPageController < ApplicationController
      skip_before_action :login_required,
        if: -> { trusted_origin? && action_name == "show" }
    end

### Example:
    # bad
    class MyPageController < ApplicationController
      skip_before_action :login_required,
        except: :admin, if: :trusted_origin?
    end

    # good
    class MyPageController < ApplicationController
      skip_before_action :login_required,
        if: -> { trusted_origin? && action_name != "admin" }
    end

@see https://api.rubyonrails.org/classes/AbstractController/Callbacks/ClassMethods.html#method-i-_normalize_callback_options