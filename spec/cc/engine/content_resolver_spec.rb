require "spec_helper"
require "rubocop"
require "cc/engine/content_resolver"

module CC::Engine
  describe ContentResolver do
    cops = RuboCop::Cop::Cop.all
    # The more docs the better -- feel free to unwhitelist cops and add readups
    whitelist = File.read("./spec/support/currently_undocumented_cops.txt").lines.map(&:chomp)

    it "has cops" do
      expect(cops.count).to eq 347
    end

    describe "#content" do
      cops.each do |cop|
        if !whitelist.include?(cop.name)
          describe "#{cop.name}" do
            it "has content" do
              resolver = ContentResolver.new(cop.name)
              expect(resolver.content).to be_a(String)
              expect(resolver.content.length).to (be > 0), "#{cop.name} should have content. Hint, update: #{resolver.content_path}"
            end
          end
        end
      end
    end
  end
end
