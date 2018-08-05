# frozen_string_literal: true

Dir.glob("cookbooks/*").select { |path| File.directory?(path) }.sort.each do |path|
  include_recipe path
end
