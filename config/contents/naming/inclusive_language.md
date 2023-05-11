Recommends the use of inclusive language instead of problematic terms.
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
`WholeWord: true` can be set on a flagged term to indicate the cop should only match when
a term matches the whole word (partial matches will not be offenses).

The cop supports autocorrection when there is only one suggestion. When there are multiple
suggestions, the best suggestion cannot be identified and will not be autocorrected.

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

### Example: FlaggedTerms: { slave: { WholeWord: true } }
    # Specify that only terms that are full matches will be flagged.

    # bad
    Slave

    # good (won't be flagged despite containing `slave`)
    TeslaVehicle