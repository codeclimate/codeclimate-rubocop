This cop checks for calls to `link_to` that contain a
`target: '_blank'` but no `rel: 'noopener'`. This can be a security
risk as the loaded page will have control over the previous page
and could change its location for phishing purposes.

### Example:
    # bad
    link_to 'Click here', url, target: '_blank'

    # good
    link_to 'Click here', url, target: '_blank', rel: 'noopener'