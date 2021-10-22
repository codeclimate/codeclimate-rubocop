# frozen_string_literal: true

require "rubocop"
require "fileutils"

# rubocop:disable Metrics/BlockLength
namespace :docs do
  desc "Scrapes documentation from the rubocop gem"
  task :scrape do
    min_lines = 3
    cop_folders = %w[bundler gemspec layout lint metrics naming performance rails security style].freeze

    `git clone https://github.com/rubocop-hq/rubocop rubocop-git`
    `cd rubocop-git && git checkout tags/v#{RuboCop::Version.version}`

    files = Dir.glob("./rubocop-git/lib/rubocop/cop/{#{cop_folders.join(",")}}/**.rb")

    documentation_files = files.each_with_object({}) do |file, hash|
      content = File.read(file)
      content = content.gsub(/.*\n.+(?=module RuboCop)/m, "")

      code_section = safety_section = false
      class_doc = content.match(/(\s+#.*)+/).to_s
      doc_lines = class_doc.
                  gsub(/^\n/, "").
                  gsub(/^(\s+#)\s+@safety$/, "\\1 ### Safety:\n\\1").
                  gsub("@example", "### Example:").
                  gsub("@good", "# good").
                  gsub("@bad", "# bad").
                  gsub(/^(\s+#\s+)\[source,([a-z]+)\]\n\s+#\s+----$/, "\\1```\\2").
                  gsub(/^(\s+#\s+)----$/, "\\1```").
                  split("\n").
                  map { |line| line.gsub(/\A\s+#\s?/, "") }.
                  map do |line|
                    if safety_section
                      # Double-check in case there are two consecutive @safety sections.
                      safety_section = line.start_with?("### Safety:") if line.start_with?("### ")
                      line.sub(/\A\s{2}/, "")
                    elsif code_section
                      code_section = false if line == "```"
                      line
                    elsif line.start_with?("### Safety:")
                      safety_section = true
                      line
                    elsif line.start_with?("```")
                      code_section = true
                      line
                    else
                      line.sub(/\A\s{2}/, " " * 4)
                    end
                  end.
                  join("\n")
      hash[file] = doc_lines
    end

    documentation_files.each do |file_path, documentation|
      namespace = file_path.split('/').slice(-2, 1).join('/')
      file_name = File.basename(file_path, '.rb')

      folder_path = "./config/contents/#{namespace}"
      write_path = "#{folder_path}/#{file_name}.md"

      if documentation.split("\n").count >= min_lines
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
# rubocop:enable Metrics/BlockLength
