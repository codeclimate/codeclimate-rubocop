# frozen_string_literal: true

require "spec_helper"
require "rubocop"
require "cc/engine/content_resolver"

module CC::Engine
  describe ContentResolver do
    cops = RuboCop::Cop::Registry.all
    # The more docs the better -- feel free to unwhitelist cops and add readups
    whitelist = File.read("./spec/support/currently_undocumented_cops.txt").lines.map(&:chomp)

    it "has cops" do
      expect(cops.count).to be > 300
    end

    describe "#content" do
      cops.each do |cop|
        context "for #{cop.name}" do
          if whitelist.include?(cop.name)
            it "has no content" do
              expect(ContentResolver.new(cop.name).content).to be false
            end
          else
            it "has content" do
              resolver = ContentResolver.new(cop.name)
              expect(resolver.content).to be_a(String), "#{cop.name} has no content, consider running `rake docs:scrape`"
              expect(resolver.content.length).to (be > 0), "#{cop.name} should have content. Hint, update: #{resolver.content_path}"
            end
          end
        end
      end
    end
  end
end
