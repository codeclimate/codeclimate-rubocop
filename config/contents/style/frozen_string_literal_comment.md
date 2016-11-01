This cop is designed to help upgrade to Ruby 3.0. It will add the
comment `# frozen_string_literal: true` to the top of files to
enable frozen string literals. Frozen string literals will be default
in Ruby 3.0. The comment will be added below a shebang and encoding
comment. The frozen string literal comment is only valid in Ruby 2.3+.