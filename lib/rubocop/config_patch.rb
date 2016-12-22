# frozen_string_literal: true

RuboCop::Config.class_eval do
  def reject_obsolete_cops
    RuboCop::Config::OBSOLETE_COPS.each do |cop_name, message|
      next unless key?(cop_name) || key?(cop_name.split('/').last)
      message += "\n(obsolete configuration found in #{loaded_path}, please" \
        ' update it)'
      $stderr.puts message
    end
  end
end
