This cop identifies possible cases where Active Record save! or related
should be used instead of save because the model might have failed to
save and an exception is better than unhandled failure.

This will ignore calls that return a boolean for success if the result
is assigned to a variable or used as the condition in an if/unless
statement.  It will also ignore calls that return a model assigned to a
variable that has a call to `persisted?`. Finally, it will ignore any
call with more than 2 arguments as that is likely not an Active Record
call or a Model.update(id, attributes) call.

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