This cop checks for the use of methods which skip
validations which are listed in
http://guides.rubyonrails.org/active_record_validations.html#skipping-validations

Methods may be ignored from this rule by configuring a `Whitelist`.

### Example:
    # bad
    Article.first.decrement!(:view_count)
    DiscussionBoard.decrement_counter(:post_count, 5)
    Article.first.increment!(:view_count)
    DiscussionBoard.increment_counter(:post_count, 5)
    person.toggle :active
    product.touch
    Billing.update_all("category = 'authorized', author = 'David'")
    user.update_attribute(:website, 'example.com')
    user.update_columns(last_request_at: Time.current)
    Post.update_counters 5, comment_count: -1, action_count: 1

    # good
    user.update(website: 'example.com')
    FileUtils.touch('file')

### Example: Whitelist: ["touch"]
    # bad
    DiscussionBoard.decrement_counter(:post_count, 5)
    DiscussionBoard.increment_counter(:post_count, 5)
    person.toggle :active

    # good
    user.touch
