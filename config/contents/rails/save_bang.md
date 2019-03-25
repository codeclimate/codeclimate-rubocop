This cop identifies possible cases where Active Record save! or related
should be used instead of save because the model might have failed to
save and an exception is better than unhandled failure.

This will allow:
- update or save calls, assigned to a variable,
    or used as a condition in an if/unless/case statement.
- create calls, assigned to a variable that then has a
    call to `persisted?`.
- calls if the result is explicitly returned from methods and blocks,
    or provided as arguments.
- calls whose signature doesn't look like an ActiveRecord
    persistence method.

By default it will also allow implicit returns from methods and blocks.
that behavior can be turned off with `AllowImplicitReturn: false`.

You can permit receivers that are giving false positives with
`AllowedReceivers: []`

### Example:

    # bad
    user.save
    user.update(name: 'Joe')
    user.find_or_create_by(name: 'Joe')
    user.destroy

    # good
    unless user.save
      # ...
    end
    user.save!
    user.update!(name: 'Joe')
    user.find_or_create_by!(name: 'Joe')
    user.destroy!

    user = User.find_or_create_by(name: 'Joe')
    unless user.persisted?
      # ...
    end

    def save_user
      return user.save
    end

### Example: AllowImplicitReturn: true (default)

    # good
    users.each { |u| u.save }

    def save_user
      user.save
    end

### Example: AllowImplicitReturn: false

    # bad
    users.each { |u| u.save }
    def save_user
      user.save
    end

    # good
    users.each { |u| u.save! }

    def save_user
      user.save!
    end

    def save_user
      return user.save
    end

### Example: AllowedReceivers: ['merchant.customers', 'Service::Mailer']

    # bad
    merchant.create
    customers.builder.save
    Mailer.create

    module Service::Mailer
      self.create
    end

    # good
    merchant.customers.create
    MerchantService.merchant.customers.destroy
    Service::Mailer.update(message: 'Message')
    ::Service::Mailer.update
    Services::Service::Mailer.update(message: 'Message')
    Service::Mailer::update
