namespace :docs do
  desc "Scrapes documentation from the rubocop gem"
  task :scrape do
    TAG = "v0.34.2"
    COP_FOLDERS = %w[lint metrics performance rails style]

    %x{git clone https://github.com/bbatsov/rubocop.git rubocop-git}
    %x{cd rubocop-git && git checkout tags/#{TAG}}

    files = Dir.glob("./rubocop-git/lib/rubocop/cop/{#{COP_FOLDERS.join(',')}}/**.rb")

    documentation = files.each_with_object({}) do |file, hash|
      content = File.read(file)
      class_doc = content.match(/(\s+#.*)+/).to_s
      doc_lines = class_doc.
        gsub(/^\n/,"").
        split("\n").
        map { |line| line.gsub(/\s+#\s?/, "") }.
        join("\n")
      hash[file] = doc_lines
    end

    documentation.each do |file_path, documentation|
      namespace = file_path.split('/').slice(-2, 1).join('/')
      file_name = File.basename(file_path, '.rb')

      folder_path = "./config/contents/#{namespace}"
      write_path = "#{folder_path}/#{file_name}.md"

      puts "Writing documentation to #{write_path}"


      FileUtils.mkdir_p(folder_path)
      File.open(write_path, 'w') do |file|
        file.write(documentation)
      end
    end

    %x{rm -rf rubocop-git}
  end
end
