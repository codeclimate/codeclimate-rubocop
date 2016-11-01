This cop checks whether comments have a leading space
after the # denoting the start of the comment. The
leading space is not required for some RDoc special syntax,
like #++, #--, #:nodoc, etc. Neither is it required for
=begin/=end comments.