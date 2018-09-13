# frozen_string_literal: true

cookbook_dirs = Dir.glob("cookbooks/*").select { |path| File.directory?(path) }
cookbook_dirs.sort.each do |path|
  include_recipe path
end
