This cop checks for redundant `begin` blocks.

Currently it checks for code like this:

### Example:

    def redundant
      begin
        ala
        bala
      rescue StandardError => e
        something
      end
    end

    def preferred
      ala
      bala
    rescue StandardError => e
      something
    end