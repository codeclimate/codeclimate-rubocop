This cop checks for the use of output safety calls like html_safe and
raw.

### Example:
    # bad
    "<p>#{text}</p>".html_safe

    # good
    content_tag(:p, text)

    # bad
    out = ""
    out << content_tag(:li, "one")
    out << content_tag(:li, "two")
    out.html_safe

    # good
    out = []
    out << content_tag(:li, "one")
    out << content_tag(:li, "two")
    safe_join(out)
