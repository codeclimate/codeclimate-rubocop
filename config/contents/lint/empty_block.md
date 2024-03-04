Checks for blocks without a body.
Such empty blocks are typically an oversight or we should provide a comment
to clarify what we're aiming for.

Empty lambdas and procs are ignored by default.

NOTE: For backwards compatibility, the configuration that allows/disallows
empty lambdas and procs is called `AllowEmptyLambdas`, even though it also
applies to procs.

### Example:
    # bad
    items.each { |item| }

    # good
    items.each { |item| puts item }

### Example: AllowComments: true (default)
    # good
    items.each do |item|
      # TODO: implement later (inner comment)
    end

    items.each { |item| } # TODO: implement later (inline comment)

### Example: AllowComments: false
    # bad
    items.each do |item|
      # TODO: implement later (inner comment)
    end

    items.each { |item| } # TODO: implement later (inline comment)

### Example: AllowEmptyLambdas: true (default)
    # good
    allow(subject).to receive(:callable).and_return(-> {})

    placeholder = lambda do
    end
    (callable || placeholder).call

    proc { }

    Proc.new { }

### Example: AllowEmptyLambdas: false
    # bad
    allow(subject).to receive(:callable).and_return(-> {})

    placeholder = lambda do
    end
    (callable || placeholder).call

    proc { }

    Proc.new { }
