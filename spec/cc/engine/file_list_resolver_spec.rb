# frozen_string_literal: true

require "spec_helper"
require "rubocop"
require "cc/engine/file_list_resolver"

module CC::Engine
  describe FileListResolver do
    include ::FilesystemHelpers

    before { @code = Dir.mktmpdir }

    let(:rubocop_config) { RuboCop::ConfigStore.new }

    it "uses default include path" do
      Dir.chdir(@code) do
        create_source_file("a.rb", "def a; true; end")
        create_source_file("not_ruby.txt", "some text")

        resolver = FileListResolver.new(root: @code, engine_config: {}, config_store: rubocop_config)
        expect(resolver.expanded_list).to eq [Pathname.new("a.rb").realpath.to_s]
      end
    end

    it "finds ruby scripts without extensions" do
      Dir.chdir(@code) do
        create_source_file("a.rb", "def a; true; end")
        create_source_file("bin/some_script", "#!/usr/bin/env ruby")

        resolver = FileListResolver.new(root: @code, engine_config: {}, config_store: rubocop_config)
        expect(resolver.expanded_list).to eq(%w[a.rb bin/some_script].map { |fn| Pathname.new(fn).realpath.to_s })
      end
    end

    it "respects engine config include_paths" do
      Dir.chdir(@code) do
        create_source_file("a.rb", "def a; true; end")
        create_source_file("src/b.rb", "def a; true; end")

        resolver = FileListResolver.new(root: @code, engine_config: { "include_paths" => %w[src/] }, config_store: rubocop_config)
        expect(resolver.expanded_list).to eq [Pathname.new("src/b.rb").realpath.to_s]
      end
    end

    it "respects rubocop excludes" do
      Dir.chdir(@code) do
        create_source_file("Gemfile", "source 'https://rubygems.org'")
        create_source_file("src/b.rb", "def a; true; end")
        create_source_file("src/c.rb", "def a; true; end")
        create_source_file(".rubocop.yml", "AllCops:\n  Exclude:\n    - src/c.rb\n    - Gemfile\n")

        resolver = FileListResolver.new(root: @code, engine_config: { "include_paths" => %w[Gemfile src/] }, config_store: rubocop_config)
        expect(resolver.expanded_list).to eq [Pathname.new("src/b.rb").realpath.to_s]
      end
    end

    it "handles missing files" do
      Dir.chdir(@code) do
        create_source_file("src/b.rb", "def a; true; end")

        resolver = FileListResolver.new(root: @code, engine_config: { "include_paths" => %w[src/ public/assets] }, config_store: rubocop_config)
        expect(resolver.expanded_list).to eq [Pathname.new("src/b.rb").realpath.to_s]
      end
    end
  end
end
