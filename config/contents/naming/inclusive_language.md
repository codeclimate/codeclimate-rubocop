This cops recommends the use of inclusive language instead of problematic terms.
The cop can check the following locations for offenses:
- identifiers
- constants
- variables
- strings
- symbols
- comments
- file paths
Each of these locations can be individually enabled/disabled via configuration,
for example CheckIdentifiers = true/false.

Flagged terms are configurable for the cop. For each flagged term an optional
Regex can be specified to identify offenses. Suggestions for replacing a flagged term can
be configured and will be displayed as part of the offense message.
An AllowedRegex can be specified for a flagged term to exempt allowed uses of the term.

### Example: FlaggedTerms: { whitelist: { Suggestions: ['allowlist'] } }
    # Suggest replacing identifier whitelist with allowlist

    # bad
    whitelist_users = %w(user1 user1)

    # good
    allowlist_users = %w(user1 user2)

### Example: FlaggedTerms: { master: { Suggestions: ['main', 'primary', 'leader'] } }
    # Suggest replacing master in an instance variable name with main, primary, or leader

    # bad
    @master_node = 'node1.example.com'

    # good
    @primary_node = 'node1.example.com'

### Example: FlaggedTerms: { whitelist: { Regex: !ruby/regexp '/white[-_\s]?list' } }
    # Identify problematic terms using a Regexp

    # bad
    white_list = %w(user1 user2)

    # good
    allow_list = %w(user1 user2)

### Example: FlaggedTerms: { master: { AllowedRegex: 'master\'?s degree' } }
    # Specify allowed uses of the flagged term as a string or regexp.

    # bad
    # They had a masters

    # good
    # They had a master's degree
