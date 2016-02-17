module FilesystemHelpers
  def create_source_file(path, content)
    abs_path = File.join(@code, path)
    FileUtils.mkdir_p(File.dirname(abs_path))
    File.write(abs_path, content)
  end
end
