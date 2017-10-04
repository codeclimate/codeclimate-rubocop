This cop checks for the use of output safety calls like html_safe,
raw, and safe_concat. These methods do not escape content. They
simply return a SafeBuffer containing the content as is. Instead,
use safe_join to join content and escape it and concat to
concatenate content and escape it, ensuring its safety.

### Example:
    user_content = "<b>hi</b>"

    # bad
    "<p>#{user_content}</p>".html_safe
    => ActiveSupport::SafeBuffer
    "<p><b>hi</b></p>"

    # good
    content_tag(:p, user_content)
    => ActiveSupport::SafeBuffer
    "<p>&lt;b&gt;hi&lt;/b&gt;</p>"

    # bad
    out = ""
    out << "<li>#{user_content}</li>"
    out << "<li>#{user_content}</li>"
    out.html_safe
    => ActiveSupport::SafeBuffer
    "<li><b>hi</b></li><li><b>hi</b></li>"

    # good
    out = []
    out << content_tag(:li, user_content)
    out << content_tag(:li, user_content)
    safe_join(out)
    => ActiveSupport::SafeBuffer
    "<li>&lt;b&gt;hi&lt;/b&gt;</li><li>&lt;b&gt;hi&lt;/b&gt;</li>"

    # bad
    out = "<h1>trusted content</h1>".html_safe
    out.safe_concat(user_content)
    => ActiveSupport::SafeBuffer
    "<h1>trusted_content</h1><b>hi</b>"

    # good
    out = "<h1>trusted content</h1>".html_safe
    out.concat(user_content)
    => ActiveSupport::SafeBuffer
    "<h1>trusted_content</h1>&lt;b&gt;hi&lt;/b&gt;"

    # safe, though maybe not good style
    out = "trusted content"
    result = out.concat(user_content)
    => String "trusted content<b>hi</b>"
    # because when rendered in ERB the String will be escaped:
    <%= result %>
    => trusted content&lt;b&gt;hi&lt;/b&gt;

    # bad
    (user_content + " " + content_tag(:span, user_content)).html_safe
    => ActiveSupport::SafeBuffer
    "<b>hi</b> <span><b>hi</b></span>"

    # good
    safe_join([user_content, " ", content_tag(:span, user_content)])
    => ActiveSupport::SafeBuffer
    "&lt;b&gt;hi&lt;/b&gt; <span>&lt;b&gt;hi&lt;/b&gt;</span>"
