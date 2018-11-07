This cop checks that methods specified in the filter's `only`
or `except` options are explicitly defined in the controller.

You can specify methods of superclass or methods added by mixins
on the filter, but these confuse developers. If you specify methods
where are defined on another controller, you should define the filter
in that controller.

### Example:
    # bad
    class LoginController < ApplicationController
      before_action :require_login, only: %i[index settings logout]

      def index
      end
    end

    # good
    class LoginController < ApplicationController
      before_action :require_login, only: %i[index settings logout]

      def index
      end

      def settings
      end

      def logout
      end
    end