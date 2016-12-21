# frozen_string_literal: true

require "rubocop"
require "fileutils"

namespace :docs do
  desc "Scrapes documentation from the rubocop gem"
  task :scrape do
    MIN_LINES = 3
    COP_FOLDERS = %w[bundler lint metrics performance rails security style].freeze

    `git clone https://github.com/bbatsov/rubocop.git rubocop-git`
    `cd rubocop-git && git checkout tags/v#{RuboCop::Version.version}`

    files = Dir.glob("./rubocop-git/lib/rubocop/cop/{#{COP_FOLDERS.join(",")}}/**.rb")

    documentation_files = files.each_with_object({}) do |file, hash|
      content = File.read(file)
      content = content.gsub(/.*\n\s+(?=module RuboCop)/, "")

      class_doc = content.match(/(\s+#.*)+/).to_s
      doc_lines = class_doc.
                  gsub(/^\n/, "").
                  gsub("@example", "### Example:").
                  gsub("@good", "# good").
                  gsub("@bad", "# bad").
                  split("\n").
                  map { |line| line.gsub(/\A\s+#\s?/, "") }.
                  map { |line| line.gsub(/\A\s{2}/, " " * 4) }.
                  join("\n")
      hash[file] = doc_lines
    end

    documentation_files.each do |file_path, documentation|
      namespace = file_path.split('/').slice(-2, 1).join('/')
      file_name = File.basename(file_path, '.rb')

      folder_path = "./config/contents/#{namespace}"
      write_path = "#{folder_path}/#{file_name}.md"

      if documentation.split("\n").count >= MIN_LINES
        puts "Writing documentation to #{write_path}"

        FileUtils.mkdir_p(folder_path)
        File.write(write_path, documentation)
      else
        puts "Documentation for #{file_name} looks poor: deleting it."
        FileUtils.rm(write_path) if File.exist?(write_path)
      end
    end

    `rm -rf rubocop-git`
  end
end
